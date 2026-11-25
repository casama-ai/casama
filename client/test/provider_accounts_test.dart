import 'package:casama/features/integrations/provider_setup.dart';
import 'package:casama_sdk/casama_sdk.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('accountPerApp prefers a connected custom account over an older managed one needing reconnect', () {
    final result = accountPerApp([
      ProviderAccount(
        app: 'googlecalendar',
        status: ProviderAccountStatusEnum.connected,
        reconnectRecommended: true,
      ),
      ProviderAccount(
        app: 'googlecalendar',
        status: ProviderAccountStatusEnum.connected,
      ),
      ProviderAccount(app: 'gmail', status: ProviderAccountStatusEnum.pending),
      ProviderAccount(
        app: 'gmail',
        status: ProviderAccountStatusEnum.connected,
        reconnectRecommended: true,
      ),
    ]);

    final byApp = {for (final a in result) a.app: a};
    expect(
      byApp['googlecalendar']?.status,
      ProviderAccountStatusEnum.connected,
    );
    expect(byApp['googlecalendar']?.reconnectRecommended, isNull);
    expect(byApp['gmail']?.status, ProviderAccountStatusEnum.connected);
    expect(byApp['gmail']?.reconnectRecommended, isTrue);
  });
}
