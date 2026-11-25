import 'package:material_ui/material_ui.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_tokens.dart';
import '../../../ui/skeleton.dart';

/// The Costs tab before its first numbers: the same header, tiles, chart and rows it becomes, so
/// nothing jumps when they arrive.
class CostsSkeleton extends StatelessWidget {
  const CostsSkeleton({super.key, required this.wide, required this.side});
  final bool wide;
  final double side;

  @override
  Widget build(BuildContext context) {
    final text = context.textTheme;
    Widget tile() => SkeletonCard(
      padding: const EdgeInsets.fromLTRB(
        AppSpace.md,
        AppSpace.sm + 2,
        AppSpace.md,
        AppSpace.sm + 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SkeletonText(style: text.labelLarge, widthFactor: 0.45),
          const SizedBox(height: AppSpace.xxs),
          SkeletonText(
            style: text.headlineSmall?.copyWith(height: 1.15),
            widthFactor: 0.6,
          ),
          const SizedBox(height: AppSpace.xxs),
          SkeletonText(style: text.bodySmall, widthFactor: 0.8),
        ],
      ),
    );
    Widget row(double name) => Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpace.md,
        vertical: 10,
      ),
      child: Row(
        children: [
          const SkeletonBone(width: 10, height: 10, radius: 5),
          const SizedBox(width: AppSpace.xs),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SkeletonText(style: text.bodyMedium, widthFactor: name),
                const SizedBox(height: 6),
                const SkeletonBone(height: 5, radius: 5),
              ],
            ),
          ),
          SizedBox(width: wide ? 320 : AppSpace.lg),
          SizedBox(
            width: 56,
            child: SkeletonText(style: text.bodyMedium, widthFactor: 1),
          ),
        ],
      ),
    );
    final across = wide ? 4 : 2;
    return SkeletonScope(
      key: const Key('costsSkeleton'),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(side, AppSpace.xs, side, AppSpace.xxl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonText(
                        style: wide ? text.titleLarge : text.titleMedium,
                        width: 120,
                      ),
                      SkeletonText(style: text.bodySmall, width: 170),
                    ],
                  ),
                ),
                SkeletonBone(width: wide ? 380 : 150, height: 36, radius: 10),
              ],
            ),
            const SizedBox(height: AppSpace.sm),
            for (var r = 0; r < 4; r += across) ...[
              if (r > 0) const SizedBox(height: AppSpace.sm),
              Row(
                spacing: AppSpace.sm,
                children: [
                  for (var c = 0; c < across; c++) Expanded(child: tile()),
                ],
              ),
            ],
            const SkeletonSectionHeader(width: 100),
            SkeletonCard(
              child: SkeletonBone(
                height: wide ? 290 : 250,
                radius: AppRadius.row,
              ),
            ),
            const SizedBox(height: AppSpace.lg),
            const SkeletonBone(height: 36, radius: 10),
            const SizedBox(height: AppSpace.sm),
            SkeletonCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  for (final w in const [0.5, 0.36, 0.42, 0.3, 0.38]) row(w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
