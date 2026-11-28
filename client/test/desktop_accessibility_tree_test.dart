// The Windows and Mac apps keep their accessibility tree on for UI Automation and Accessibility
// clients that aren't screen readers (the customer's build 117 round: Windows still showed one
// empty "FLUTTERVIEW" pane after D-616, and the Mac exposed only its title-bar buttons).
//
// The switch has to be thrown on the engine by the runner, before Dart draws: both embedders drop
// semantics until their accessibility bridge exists, and a handle taken in Dart makes the framework
// send its whole tree into nothing and then only changes. These checks keep it that way.
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

String _read(String path) => File(path).readAsStringSync();

void main() {
  test('Dart takes no semantics handle at startup', () {
    final main = _read('lib/main.dart');
    expect(main.contains('ensureSemantics('), isFalse);
    expect(main.contains('keepWindowsSemanticsOn'), isFalse);
  });

  test('the Windows runner asks for the tree once the view exists', () {
    final runner = _read('windows/runner/flutter_window.cpp');
    expect(runner, contains('WM_GETOBJECT'));
    expect(runner, contains('OBJID_CLIENT'));
    final setChild = runner.indexOf('SetChildContent(flutter_controller_');
    final enable = runner.indexOf(
      'EnableAccessibilityTree(flutter_controller_',
    );
    expect(setChild, greaterThan(0));
    expect(enable, greaterThan(setChild));
  });

  test('the Mac runner turns semantics on after the engine starts', () {
    final window = _read('macos/Runner/MainFlutterWindow.swift');
    expect(window, contains('CasamaFlutterViewController()'));
    expect(window, contains('super.viewWillAppear()'));
    expect(window, contains('forKey: Self.semanticsKey'));
    expect(window, contains('"semanticsEnabled"'));
  });
}
