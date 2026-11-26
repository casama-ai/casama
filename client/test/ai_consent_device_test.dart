import 'package:casama/core/ai_consent_device.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  const meta = {
    'ai_consent_at': '2026-11-24T08:00:00Z',
    'ai_consent_version': 2,
  };

  setUp(AiConsentDevice.resetForTest);

  test(
    'an account that agreed elsewhere still asks on a fresh install',
    () async {
      SharedPreferences.setMockInitialValues({});
      await AiConsentDevice.preload();
      expect(AiConsentDevice.consentAt('user-a', meta), isNull);
    },
  );

  test('agreeing on this device counts after the app restarts', () async {
    SharedPreferences.setMockInitialValues({});
    await AiConsentDevice.save('user-a');
    AiConsentDevice.resetForTest();
    await AiConsentDevice.preload();
    expect(
      AiConsentDevice.consentAt('user-a', meta),
      DateTime.utc(2026, 11, 24, 8),
    );
  });

  test('another account on the same device is asked again', () async {
    SharedPreferences.setMockInitialValues({AiConsentDevice.key: 'user-a'});
    await AiConsentDevice.preload();
    expect(AiConsentDevice.consentAt('user-b', meta), isNull);
  });

  test('signing out or withdrawing forgets it on the device', () async {
    SharedPreferences.setMockInitialValues({AiConsentDevice.key: 'user-a'});
    await AiConsentDevice.preload();
    await AiConsentDevice.save(null);
    expect(AiConsentDevice.consentAt('user-a', meta), isNull);
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.containsKey(AiConsentDevice.key), isFalse);
  });

  test(
    'the device record alone is not consent: the account must have agreed too',
    () async {
      SharedPreferences.setMockInitialValues({AiConsentDevice.key: 'user-a'});
      await AiConsentDevice.preload();
      expect(AiConsentDevice.consentAt('user-a', const {}), isNull);
      expect(AiConsentDevice.consentAt(null, meta), isNull);
    },
  );
}
