import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/localization_ext.dart';
import '../../../../base/base.dart';
import '../../../../extentions/extention.dart';
import '../../../main/dashboard/dashboard_screen.dart';
import '../bloc/signin_bloc.dart';

part 'signin.action.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = '/singin';
  static const String usernameKey = 'usernname_text_input';
  static const String passwordKey = 'password_text_input';
  static const String loginBtnKey = 'login_button';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends StateBase<SignInScreen> {
  final _icUserName = InputContainerController();
  final _icPassword = InputContainerController();

  bool rememberLogin = false;

  @override
  SigninBloc get bloc => BlocProvider.of(context);

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  late AppLocalizations trans;

  @override
  void onLogicError(String? message) {
    showNoticeDialog(
      context: context,
      title: trans.inform,
      message: trans.loginWithInvalidUsernameOrPasss,
      onClose: onCloseErrorDialog,
    );
  }

  @override
  void showLoginRequired({String? message, Function()? onConfirmed}) {
    showNoticeDialog(
      context: context,
      title: trans.inform,
      message: trans.loginWithInvalidUsernameOrPasss,
      onClose: onCloseErrorDialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    trans = translate(context);

    return BlocConsumer<SigninBloc, SigninState>(
      listener: _blocListener,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: _buildBody(context, state),
              ),
            ),
            resizeToAvoidBottomInset: false,
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, SigninState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 22,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 32),
          Text(
            trans.login,
            style: textTheme.displayLarge,
          ),
          const SizedBox(height: 24),
          InputContainer(
            key: const ValueKey(SignInScreen.usernameKey),
            controller: _icUserName,
            hint: trans.enterUsername,
            title: trans.username,
            titleStyle: textTheme.bodyLarge,
            onEditingComplete: _icPassword.requestFocus,
          ),
          const SizedBox(height: 24),
          InputContainer(
            key: const ValueKey(SignInScreen.passwordKey),
            controller: _icPassword,
            hint: trans.enterPassword,
            title: trans.password,
            titleStyle: textTheme.bodyLarge,
            onEditingComplete: _onContinue,
            isPassword: true,
            scrollPadding: const EdgeInsets.all(20).copyWith(
              bottom: 130,
            ),
          ),
          const SizedBox(height: 24),
          ThemeButton.primary(
            key: const ValueKey(SignInScreen.loginBtnKey),
            title: trans.login,
            onPressed: _onContinue,
          ),
        ],
      ),
    );
  }
}
