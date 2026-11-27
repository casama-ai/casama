import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';

/// Mutes every animation (spinners, typing dots, Lottie bots, shimmer) while a desktop window
/// isn't in front (D-615). An endless animation asks for a frame on every vsync, and a covered
/// Mac window reports `inactive`, not `hidden`, so frames kept running: the customer measured
/// 61–67% CPU with Casama hidden and every bot idle (build 108). Live video is a texture and
/// keeps playing; text that arrives still shows.
class BackgroundTickers extends StatefulWidget {
  const BackgroundTickers({super.key, required this.child, this.desktop});

  final Widget child;

  /// Whether this is a desktop app; worked out from the platform when null (tests set it).
  final bool? desktop;

  static bool get _isDesktop =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.macOS ||
          defaultTargetPlatform == TargetPlatform.windows ||
          defaultTargetPlatform == TargetPlatform.linux);

  @override
  State<BackgroundTickers> createState() => _BackgroundTickersState();
}

class _BackgroundTickersState extends State<BackgroundTickers> {
  late final AppLifecycleListener _life;
  bool _front = true;

  @override
  void initState() {
    super.initState();
    final now = WidgetsBinding.instance.lifecycleState;
    _front = now == null || now == AppLifecycleState.resumed;
    _life = AppLifecycleListener(onStateChange: _changed);
  }

  void _changed(AppLifecycleState s) {
    final front = s == AppLifecycleState.resumed;
    if (front != _front && mounted) setState(() => _front = front);
  }

  @override
  void dispose() {
    _life.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final desktop = widget.desktop ?? BackgroundTickers._isDesktop;
    return TickerMode(enabled: !desktop || _front, child: widget.child);
  }
}
