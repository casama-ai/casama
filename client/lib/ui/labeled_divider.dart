import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import '../theme/app_tokens.dart';

/// A line with words in the middle ("or join with a code"). Words too long for one line, in a
/// longer language or at a large text size, wrap and keep a stub of line on each side.
class LabeledDivider extends StatelessWidget {
  const LabeledDivider({super.key, required this.label, this.style});

  final String label;
  final TextStyle? style;

  /// The least line left on each side.
  static const _stub = 24.0;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) => Row(
      children: [
        const Expanded(child: Divider()),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: math.max(0, constraints.maxWidth - 2 * _stub)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.sm),
            child: Text(label, textAlign: TextAlign.center, style: style),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    ),
  );
}
