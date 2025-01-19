// ignore_for_file: avoid_print

import 'dart:io' show sleep;

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart' show findsOneWidget;
import 'package:test/test.dart';

import 'app.dart' as e2e_app;

void main() {
  group('Running App Test Driver', () {
    e2e_app.main();

    late final FlutterDriver driver;

    /// Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();

      sleep(const Duration(seconds: 2));
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      await driver.close();
    });

    test(
      '---> DRIVER TEST TO ATHENTICATE',
      () async {
        await driver.clearTimeline();

        await enterText(
          driver,
          'usernname_text_input',
          'admin@test.com',
        );

        await enterText(
          driver,
          'password_text_input',
          'Admin@password',
        );

        await tapButton(
          driver,
          'login_button',
        );

        expect(find.text('Home'), findsOneWidget);
      },
      timeout: const Timeout(Duration(minutes: 20)),
    );
  });
}

Future<void> tapButton(
  FlutterDriver driver,
  String key, {
  Duration sleepDur = const Duration(seconds: 2),
}) async {
  print('---> tapButton key: $key');
  await driver.runUnsynchronized(() async {
    final finder = find.byValueKey(key);

    await driver.waitFor(finder, timeout: const Duration(seconds: 30));

    sleep(sleepDur);

    await driver.tap(finder, timeout: const Duration(seconds: 30));
  });
}

Future<void> enterText(
  FlutterDriver driver,
  String key,
  String text, {
  Duration sleepDur = const Duration(seconds: 2),
}) async {
  print('---> enterText key: $key - text: $text');
  await driver.runUnsynchronized(() async {
    final textField = find.byValueKey(key);

    await driver.waitFor(textField, timeout: const Duration(seconds: 30));

    sleep(sleepDur);

    await driver.tap(textField, timeout: const Duration(seconds: 30));
    await driver.enterText(text, timeout: const Duration(seconds: 30));
  });
}
