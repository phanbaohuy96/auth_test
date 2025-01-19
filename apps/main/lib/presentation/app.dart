import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../di/di.dart';
import '../l10n/generated/app_localizations.dart';
import 'modules/authentication/signin/views/signin_screen.dart';
import 'route/route.dart';
import 'theme/theme.dart';

class MainApplization extends StatefulWidget {
  const MainApplization({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MainApplization> {
  final themeSetting = MainAppTheme.normal();

  late final appBloc = injector<AppGlobalBloc>(
    param1: AppGlobalState(
      lightTheme: themeSetting.light,
      darkTheme: themeSetting.dark,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => appBloc),
      ],
      child: BlocBuilder<AppGlobalBloc, AppGlobalState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.lightTheme?.theme,
            darkTheme: state.darkTheme?.theme,
            themeMode: state.themeMode,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              FlMeidaLocalizations.delegate,
              CoreLocalizations.delegate,
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocale.supportedLocales,
            locale: state.locale,
            onGenerateRoute: RouteGenerator().generateRoute,
            navigatorObservers: [myNavigatorObserver],
            navigatorKey: navigatorKey,
            initialRoute: SignInScreen.routeName,
            builder: EasyLoading.init(
              builder: (_, child) {
                return TextScaleFixed(
                  child: child ?? const SizedBox(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
