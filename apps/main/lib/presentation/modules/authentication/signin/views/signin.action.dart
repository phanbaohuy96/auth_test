part of 'signin_screen.dart';

extension SignInAction on _SignInScreenState {
  void _blocListener(BuildContext context, SigninState state) {
    hideLoading();

    if (state is LoginSuccess) {
      goToDashboardOrCallbackSuccess();
    }
  }

  void _onContinue() {
    _icPassword.clearError();
    _icUserName.clearError();

    final username = _icUserName.text.trim();
    if (username.isNullOrEmpty) {
      _icUserName.setError(trans.pleaseEnterUsername);
      return;
    }
    final password = _icPassword.text;
    if (password.isNullOrEmpty) {
      _icPassword.setError(trans.pleaseEnterPassword);
      return;
    }
    showLoading();
    bloc.add(
      LoginEvent(
        username: username,
        password: password,
      ),
    );
  }

  void goToDashboardOrCallbackSuccess() {
    if (myNavigatorObserver.constaintRoute(DashboardScreen.routeName)) {
      Navigator.pop(context, true);
    } else {
      Navigator.of(context).pushReplacementNamed(
        DashboardScreen.routeName,
      );
    }
  }
}
