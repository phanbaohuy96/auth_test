import 'package:authentication_test/di/di.dart';
import 'package:authentication_test/domain/usecases/auth/auth_usecase.dart';
import 'package:authentication_test/l10n/localization_ext.dart';
import 'package:authentication_test/presentation/modules/authentication/signin/bloc/signin_bloc.dart';
import 'package:authentication_test/presentation/modules/authentication/signin/views/signin_screen.dart';
import 'package:authentication_test/presentation/theme/theme.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<AuthUsecase>()])
import 'signin_ui_test.mocks.dart';

void main() {
  setUpAll(() async {
    injector
      ..registerFactory<LogUtils>(LogUtils.new)
      ..registerFactory<AuthUsecase>(MockAuthUsecase.new)
      ..registerFactory<SigninBloc>(() => SigninBloc(MockAuthUsecase()));
  });

  testWidgets('TEST UI SIGNIN SCREEN', (WidgetTester tester) async {
    final widget = MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SigninBloc(MockAuthUsecase()),
        ),
      ],
      child: const SignInScreen(),
    );
    final theme = MainAppTheme.normal();
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: theme.light.theme,
        darkTheme: theme.dark.theme,
        themeMode: ThemeMode.light,
        supportedLocales: const [AppLocale.vi, AppLocale.en],
        locale: AppLocale.en,
        home: widget,
      ),
    );

    /// Check UI components
    expect(
      find.byKey(const ValueKey(SignInScreen.usernameKey)),
      findsOneWidget,
    );

    expect(
      find.byKey(const ValueKey(SignInScreen.passwordKey)),
      findsOneWidget,
    );

    expect(
      find.byKey(const ValueKey(SignInScreen.loginBtnKey)),
      findsOneWidget,
    );

    /// Check UI validation
    await tester.tap(find.byKey(const ValueKey(SignInScreen.loginBtnKey)));

    expect(
      find.text('Please enter username'),
      findsOneWidget,
    );

    await tester.enterText(
      find.byKey(const ValueKey(SignInScreen.usernameKey)),
      'test@mail.com',
    );

    expect(
      find.text('Please enter username'),
      findsNothing,
    );

    await tester.tap(find.byKey(const ValueKey(SignInScreen.loginBtnKey)));

    expect(
      find.text('Please enter password'),
      findsOneWidget,
    );
  });
}
