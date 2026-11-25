// Go to an address in this same browser tab, as a plain link would (D-567). Off the web it does
// nothing and returns false.
export 'same_tab_stub.dart' if (dart.library.js_interop) 'same_tab_web.dart';
