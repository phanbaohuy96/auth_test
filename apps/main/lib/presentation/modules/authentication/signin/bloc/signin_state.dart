part of 'signin_bloc.dart';

class _StateData {
  const _StateData();

  _StateData copyWith() {
    return const _StateData();
  }
}

abstract class SigninState {
  final _StateData data;

  SigninState(this.data);

  T copyWith<T extends SigninState>({
    _StateData? data,
  }) {
    return _factories[T == SigninState ? runtimeType : T]!(
      data ?? this.data,
    );
  }
}

class SigninInitial extends SigninState {
  SigninInitial({
    _StateData data = const _StateData(),
  }) : super(data);
}

class LoginSuccess extends SigninState {
  LoginSuccess({
    _StateData data = const _StateData(),
  }) : super(data);
}

final _factories = <Type,
    Function(
  _StateData data,
)>{
  SigninInitial: (data) => SigninInitial(
        data: data,
      ),
  LoginSuccess: (data) => LoginSuccess(
        data: data,
      ),
};
