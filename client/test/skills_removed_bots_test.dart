// Skills of deleted bots don't show as "Only for A removed bot" groups (the customer's build 108
// round: code-change twice, under two of them).
import 'package:casama/core/backend.dart';
import 'package:casama/features/skills/skills_screen.dart';
import 'package:casama/l10n/generated/app_localizations_en.dart';
import 'package:flutter_test/flutter_test.dart';

import 'fake_backend.dart';

SkillView _skill(String id, String name, {String? botId}) => SkillView(
  id: id,
  name: name,
  description: '',
  bodyMd: '',
  enabled: true,
  botId: botId,
);

void main() {
  test('copies of deleted bots are left out, the live bot keeps its group', () {
    final l10n = AppLocalizationsEn();
    final groups = groupSkills(
      [
        _skill('s1', 'check-inbox'),
        _skill('s2', 'code-change', botId: 'gone-1'),
        _skill('s3', 'code-change', botId: 'gone-2'),
        _skill('s4', 'weekly-report', botId: botId),
      ],
      [FakeBackend().bot()],
      l10n,
    );
    expect(groups.map((g) => g.$1), [
      l10n.skillsForAllBots,
      l10n.skillsOnlyForBot('Ada'),
    ]);
    expect(
      [
        for (final g in groups)
          for (final s in g.$2) s.name,
      ],
      ['check-inbox', 'weekly-report'],
    );
  });
}
