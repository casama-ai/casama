#include "my_application.h"

#include <flutter_linux/flutter_linux.h>
#ifdef GDK_WINDOWING_X11
#include <gdk/gdkx.h>
#endif
#ifdef CASAMA_APP_BROWSER
#include <dlfcn.h>
#include <limits.h>
#include <unistd.h>
#include <cstring>
#include <string>
#endif

#include "flutter/generated_plugin_registrant.h"

#ifdef CASAMA_APP_BROWSER
typedef gboolean (*CasamaAppBrowserAttachFn)(GtkWindow*, GtkOverlay*, FlView*, FlBinaryMessenger*);
typedef void (*CasamaAppBrowserVoidFn)(void);

struct LinuxAppBrowserLoader {
  void* handle = nullptr;
  CasamaAppBrowserAttachFn attach = nullptr;
  CasamaAppBrowserVoidFn window_hidden = nullptr;
  CasamaAppBrowserVoidFn detach = nullptr;
  FlMethodChannel* fallback_channel = nullptr;
};

static void fallback_app_browser_call(FlMethodChannel*,
                                      FlMethodCall* call,
                                      gpointer) {
  const char* method = fl_method_call_get_name(call);
  if (std::strcmp(method, "supported") == 0) {
    g_autoptr(FlValue) out = fl_value_new_map();
    fl_value_set_string_take(out, "supported", fl_value_new_bool(FALSE));
    fl_value_set_string_take(out, "reason", fl_value_new_string("needs_webkitgtk"));
    fl_value_set_string_take(out, "realTaps", fl_value_new_bool(FALSE));
    fl_method_call_respond_success(call, out, nullptr);
  } else if (std::strcmp(method, "dispose") == 0 ||
             std::strcmp(method, "setOverlayBounds") == 0) {
    g_autoptr(FlValue) v = fl_value_new_null();
    fl_method_call_respond_success(call, v, nullptr);
  } else {
    fl_method_call_respond_error(call, "unsupported", "needs_webkitgtk",
                                 nullptr, nullptr);
  }
}

static void attach_linux_app_browser(LinuxAppBrowserLoader* loader,
                                     GtkWindow* window,
                                     GtkOverlay* overlay,
                                     FlView* view) {
  FlEngine* engine = fl_view_get_engine(view);
  FlBinaryMessenger* messenger = fl_engine_get_binary_messenger(engine);
  if (!messenger) return;

  // Try RPATH first, then explicit `<exe_dir>/lib/libcasama_app_browser.so`.
  loader->handle = dlopen("libcasama_app_browser.so", RTLD_NOW | RTLD_LOCAL);
  if (!loader->handle) {
    char buf[PATH_MAX];
    ssize_t len = readlink("/proc/self/exe", buf, sizeof(buf) - 1);
    if (len > 0) {
      buf[len] = '\0';
      gchar* dir = g_path_get_dirname(buf);
      if (dir) {
        std::string full = std::string(dir) + "/lib/libcasama_app_browser.so";
        loader->handle = dlopen(full.c_str(), RTLD_NOW | RTLD_LOCAL);
        g_free(dir);
      }
    }
  }
  if (loader->handle) {
    loader->attach = reinterpret_cast<CasamaAppBrowserAttachFn>(
        dlsym(loader->handle, "casama_app_browser_attach"));
    loader->window_hidden = reinterpret_cast<CasamaAppBrowserVoidFn>(
        dlsym(loader->handle, "casama_app_browser_window_hidden"));
    loader->detach = reinterpret_cast<CasamaAppBrowserVoidFn>(
        dlsym(loader->handle, "casama_app_browser_detach"));
    if (loader->attach && loader->attach(window, overlay, view, messenger)) {
      return;
    }
    dlclose(loader->handle);
    loader->handle = nullptr;
    loader->attach = nullptr;
    loader->window_hidden = nullptr;
    loader->detach = nullptr;
  }

  // WebKitGTK 4.1 (>= 2.40) not installed: report `needs_webkitgtk` cleanly.
  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  loader->fallback_channel = fl_method_channel_new(
      messenger, "casama/app_browser", FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(
      loader->fallback_channel, fallback_app_browser_call, nullptr, nullptr);
}

static void detach_linux_app_browser(LinuxAppBrowserLoader* loader) {
  if (loader->detach) loader->detach();
  loader->attach = nullptr;
  loader->window_hidden = nullptr;
  loader->detach = nullptr;
  if (loader->handle) {
    dlclose(loader->handle);
    loader->handle = nullptr;
  }
  if (loader->fallback_channel) {
    fl_method_channel_set_method_call_handler(
        loader->fallback_channel, nullptr, nullptr, nullptr);
    g_clear_object(&loader->fallback_channel);
  }
}

static gboolean on_window_delete_or_unmap(GtkWidget*, GdkEvent*, gpointer data) {
  auto* loader = static_cast<LinuxAppBrowserLoader*>(data);
  if (loader && loader->window_hidden) loader->window_hidden();
  return FALSE;
}
#endif

struct _MyApplication {
  GtkApplication parent_instance;
  char** dart_entrypoint_arguments;
#ifdef CASAMA_APP_BROWSER
  LinuxAppBrowserLoader app_browser;
#endif
};

G_DEFINE_TYPE(MyApplication, my_application, GTK_TYPE_APPLICATION)

// Called when first Flutter frame received.
static void first_frame_cb(MyApplication* self, FlView* view) {
  gtk_widget_show(gtk_widget_get_toplevel(GTK_WIDGET(view)));
}

// Implements GApplication::activate.
static void my_application_activate(GApplication* application) {
  MyApplication* self = MY_APPLICATION(application);

  // One Casama per session: opening it again, or a casama:// link, brings this window forward
  // (the link reaches Dart through app_links) instead of starting a second copy with its own
  // tray icon, shortcut and connection to this computer.
  GList* windows = gtk_application_get_windows(GTK_APPLICATION(application));
  if (windows) {
    gtk_window_present(GTK_WINDOW(windows->data));
    return;
  }

  GtkWindow* window =
      GTK_WINDOW(gtk_application_window_new(GTK_APPLICATION(application)));

  // Use a header bar when running in GNOME as this is the common style used
  // by applications and is the setup most users will be using (e.g. Ubuntu
  // desktop).
  // If running on X and not using GNOME then just use a traditional title bar
  // in case the window manager does more exotic layout, e.g. tiling.
  // If running on Wayland assume the header bar will work (may need changing
  // if future cases occur).
  gboolean use_header_bar = TRUE;
#ifdef GDK_WINDOWING_X11
  GdkScreen* screen = gtk_window_get_screen(window);
  if (GDK_IS_X11_SCREEN(screen)) {
    const gchar* wm_name = gdk_x11_screen_get_window_manager_name(screen);
    if (g_strcmp0(wm_name, "GNOME Shell") != 0) {
      use_header_bar = FALSE;
    }
  }
#endif
  if (use_header_bar) {
    GtkHeaderBar* header_bar = GTK_HEADER_BAR(gtk_header_bar_new());
    gtk_widget_show(GTK_WIDGET(header_bar));
    gtk_header_bar_set_title(header_bar, "Casama");
    gtk_header_bar_set_show_close_button(header_bar, TRUE);
    gtk_window_set_titlebar(window, GTK_WIDGET(header_bar));
  } else {
    gtk_window_set_title(window, "Casama");
  }

  gtk_window_set_default_size(window, 1280, 800);

  g_autoptr(FlDartProject) project = fl_dart_project_new();
  fl_dart_project_set_dart_entrypoint_arguments(
      project, self->dart_entrypoint_arguments);

  FlView* view = fl_view_new(project);
  GdkRGBA background_color;
  // Background defaults to black, override it here if necessary, e.g. #00000000
  // for transparent.
  gdk_rgba_parse(&background_color, "#000000");
  fl_view_set_background_color(view, &background_color);
  gtk_widget_show(GTK_WIDGET(view));
#ifdef CASAMA_APP_BROWSER
  GtkWidget* overlay = gtk_overlay_new();
  gtk_container_add(GTK_CONTAINER(overlay), GTK_WIDGET(view));
  gtk_widget_show(overlay);
  gtk_container_add(GTK_CONTAINER(window), overlay);
#else
  gtk_container_add(GTK_CONTAINER(window), GTK_WIDGET(view));
#endif

  // Show the window when Flutter renders.
  // Requires the view to be realized so we can start rendering.
  g_signal_connect_swapped(view, "first-frame", G_CALLBACK(first_frame_cb),
                           self);
  gtk_widget_realize(GTK_WIDGET(view));

  fl_register_plugins(FL_PLUGIN_REGISTRY(view));

#ifdef CASAMA_APP_BROWSER
  attach_linux_app_browser(&self->app_browser, window, GTK_OVERLAY(overlay),
                           view);
  g_signal_connect(window, "delete-event",
                   G_CALLBACK(on_window_delete_or_unmap), &self->app_browser);
  g_signal_connect(window, "unmap-event",
                   G_CALLBACK(on_window_delete_or_unmap), &self->app_browser);
#endif

  gtk_widget_grab_focus(GTK_WIDGET(view));
}

// Implements GApplication::local_command_line.
static gboolean my_application_local_command_line(GApplication* application,
                                                  gchar*** arguments,
                                                  int* exit_status) {
  MyApplication* self = MY_APPLICATION(application);
  // Strip out the first argument as it is the binary name.
  self->dart_entrypoint_arguments = g_strdupv(*arguments + 1);

  g_autoptr(GError) error = nullptr;
  if (!g_application_register(application, nullptr, &error)) {
    g_warning("Failed to register: %s", error->message);
    *exit_status = 1;
    return TRUE;
  }

  g_application_activate(application);
  *exit_status = 0;

  // FALSE: the arguments go on to the first copy (the "command-line" signal app_links reads).
  return FALSE;
}

// Implements GApplication::startup.
static void my_application_startup(GApplication* application) {
  // MyApplication* self = MY_APPLICATION(object);

  // Perform any actions required at application startup.

  G_APPLICATION_CLASS(my_application_parent_class)->startup(application);
}

// Implements GApplication::shutdown.
static void my_application_shutdown(GApplication* application) {
#ifdef CASAMA_APP_BROWSER
  MyApplication* self = MY_APPLICATION(application);
  detach_linux_app_browser(&self->app_browser);
#endif

  G_APPLICATION_CLASS(my_application_parent_class)->shutdown(application);
}

// Implements GObject::dispose.
static void my_application_dispose(GObject* object) {
  MyApplication* self = MY_APPLICATION(object);
  g_clear_pointer(&self->dart_entrypoint_arguments, g_strfreev);
  G_OBJECT_CLASS(my_application_parent_class)->dispose(object);
}

static void my_application_class_init(MyApplicationClass* klass) {
  G_APPLICATION_CLASS(klass)->activate = my_application_activate;
  G_APPLICATION_CLASS(klass)->local_command_line =
      my_application_local_command_line;
  G_APPLICATION_CLASS(klass)->startup = my_application_startup;
  G_APPLICATION_CLASS(klass)->shutdown = my_application_shutdown;
  G_OBJECT_CLASS(klass)->dispose = my_application_dispose;
}

static void my_application_init(MyApplication* self) {}

MyApplication* my_application_new() {
  // Set the program name to the application ID, which helps various systems
  // like GTK and desktop environments map this running application to its
  // corresponding .desktop file. This ensures better integration by allowing
  // the application to be recognized beyond its binary name.
  g_set_prgname(APPLICATION_ID);

  return MY_APPLICATION(g_object_new(my_application_get_type(),
                                     "application-id", APPLICATION_ID, "flags",
                                     G_APPLICATION_HANDLES_COMMAND_LINE |
                                         G_APPLICATION_HANDLES_OPEN,
                                     nullptr));
}
