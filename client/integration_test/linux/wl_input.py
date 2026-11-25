#!/usr/bin/env python3
"""Types keys into a headless GNOME Shell through Mutter's remote desktop interface.

Used by `app_browser_linux_test.dart` (CASAMA_WL_INPUT) inside the private session that
`ime_session.sh` starts. Only ever point it at a test session's bus: on the real desktop it would
type into whatever window has focus.

  wl_input.py type 'nihao '     press and release each character as a keysym
  wl_input.py key Return        one named keysym (Return, space, BackSpace, Escape, ...)
  wl_input.py hold              keep a keyboard on the seat until killed (ime_session.sh does it)
  wl_input.py combo Alt_L+Tab   hold the first keys, tap the last (focuses the newest window)
  wl_input.py click 720 470     a left click at that point of the screen
"""
import sys
import time

from gi.repository import Gio, GLib

NAMED = {
    "Return": 0xFF0D, "space": 0x0020, "BackSpace": 0xFF08, "Escape": 0xFF1B,
    "Tab": 0xFF09, "Alt_L": 0xFFE9, "Shift_L": 0xFFE1, "Control_L": 0xFFE3, "Super_L": 0xFFEB,
}


def main() -> int:
    if "casama" not in (GLib.getenv("DBUS_SESSION_BUS_ADDRESS") or "") and not GLib.getenv(
        "CASAMA_WL_INPUT_ANY_BUS"
    ):
        print("refusing: DBUS_SESSION_BUS_ADDRESS isn't a casama test bus", file=sys.stderr)
        return 2
    bus = Gio.bus_get_sync(Gio.BusType.SESSION, None)
    rd = Gio.DBusProxy.new_sync(
        bus, 0, None, "org.gnome.Mutter.RemoteDesktop",
        "/org/gnome/Mutter/RemoteDesktop", "org.gnome.Mutter.RemoteDesktop", None,
    )
    path = rd.call_sync("CreateSession", None, 0, -1, None).unpack()[0]
    session = Gio.DBusProxy.new_sync(
        bus, 0, None, "org.gnome.Mutter.RemoteDesktop", path,
        "org.gnome.Mutter.RemoteDesktop.Session", None,
    )
    session.call_sync("Start", None, 0, -1, None)
    time.sleep(1.0)

    def tap(keysym: int) -> None:
        for pressed in (True, False):
            session.call_sync(
                "NotifyKeyboardKeysym", GLib.Variant("(ub)", (keysym, pressed)), 0, -1, None
            )
            time.sleep(0.04)
        time.sleep(0.08)

    try:
        if sys.argv[1] == "type":
            for ch in sys.argv[2]:
                tap(ord(ch) if ord(ch) < 0x100 else 0x01000000 | ord(ch))
        elif sys.argv[1] == "key":
            tap(NAMED[sys.argv[2]])
        elif sys.argv[1] == "hold":
            # A headless seat has a keyboard only while a remote desktop session has one, and
            # windows that started before it never get key events. ime_session.sh keeps this one
            # alive for the whole run so every window has a keyboard from the start.
            tap(NAMED["Shift_L"])
            print("holding", flush=True)
            GLib.MainLoop().run()
        elif sys.argv[1] == "combo":
            names = sys.argv[2].split("+")
            for n in names[:-1]:
                session.call_sync("NotifyKeyboardKeysym", GLib.Variant("(ub)", (NAMED[n], True)), 0, -1, None)
                time.sleep(0.05)
            tap(NAMED[names[-1]])
            time.sleep(0.3)
            for n in reversed(names[:-1]):
                session.call_sync("NotifyKeyboardKeysym", GLib.Variant("(ub)", (NAMED[n], False)), 0, -1, None)
                time.sleep(0.05)
        elif sys.argv[1] == "click":
            # From the top-left corner (motion is clamped there), then to x, y in logical pixels.
            move = lambda dx, dy: session.call_sync(
                "NotifyPointerMotionRelative", GLib.Variant("(dd)", (dx, dy)), 0, -1, None
            )
            move(-10000.0, -10000.0)
            time.sleep(0.1)
            move(float(sys.argv[2]), float(sys.argv[3]))
            time.sleep(0.2)
            for pressed in (True, False):
                session.call_sync(
                    "NotifyPointerButton", GLib.Variant("(ib)", (272, pressed)), 0, -1, None
                )
                time.sleep(0.05)
        else:
            print(__doc__, file=sys.stderr)
            return 2
    finally:
        session.call_sync("Stop", None, 0, -1, None)
    return 0


if __name__ == "__main__":
    sys.exit(main())
