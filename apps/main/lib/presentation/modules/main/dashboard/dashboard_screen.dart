import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../../base/base.dart';
import '../../../extentions/extention.dart';

part 'dashboard.action.dart';

class DashboardScreen extends StatefulWidget {
  static String routeName = '/dashboard';

  DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends StateBase<DashboardScreen> {
  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  late AppLocalizations trans;

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    trans = translate(context);
    return Scaffold(
      body: Text(trans.homepage),
    );
  }
}
