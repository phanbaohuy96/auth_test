// ignore_for_file: avoid_print

import 'package:authentication_test/main_dev.dart' as app;
import 'package:flutter_driver/driver_extension.dart';

void main() {
  enableFlutterDriverExtension();
  print('---> START TEST DRIVER ON MAIN_DEV');
  app.main();
}
