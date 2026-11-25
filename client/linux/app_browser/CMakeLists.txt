cmake_minimum_required(VERSION 3.13)
project(casama_app_browser LANGUAGES CXX)

find_package(PkgConfig REQUIRED)
pkg_check_modules(WEBKIT2GTK REQUIRED IMPORTED_TARGET webkit2gtk-4.1)
pkg_check_modules(GDK_PIXBUF REQUIRED IMPORTED_TARGET gdk-pixbuf-2.0)

add_library(casama_app_browser SHARED
  "app_browser.cc"
  "app_browser_cursor.cc"
)

apply_standard_settings(casama_app_browser)
# WebKitGTK 4.1 point releases (2.40..2.52) deprecate a few GTK 3 APIs that the
# 2.40 floor (Ubuntu 22.04) still requires.
target_compile_options(casama_app_browser PRIVATE -Wno-deprecated-declarations)

set_target_properties(casama_app_browser PROPERTIES
  CXX_VISIBILITY_PRESET default
  INSTALL_RPATH "$ORIGIN"
)

target_link_libraries(casama_app_browser PRIVATE
  flutter
  PkgConfig::GTK
  PkgConfig::WEBKIT2GTK
  PkgConfig::GDK_PIXBUF
)

target_include_directories(casama_app_browser PRIVATE
  "${CMAKE_CURRENT_SOURCE_DIR}"
)
