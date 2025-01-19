import 'package:core/presentation/theme/export.dart';

import 'screen_theme.dart';
import 'theme_color.dart';

class MainAppTheme {
  final AppTheme light;
  final AppTheme dark;

  MainAppTheme(this.light, this.dark);

  MainAppTheme.normal()
      : light = AppTheme.factory(
          screenTheme: const ScreenTheme(
            screenFormTheme: AppScreenFormTheme(),
          ),
          themeColor: CustomerThemeColor(),
          fontFamily: 'SF-Pro',
        ),
        dark = AppTheme.factory(
          screenTheme: const ScreenTheme(
            screenFormTheme: AppScreenFormDarkTheme(),
          ),
          themeColor: CustomerDarkThemeColor(),
          fontFamily: 'SF-Pro',
        );
}
