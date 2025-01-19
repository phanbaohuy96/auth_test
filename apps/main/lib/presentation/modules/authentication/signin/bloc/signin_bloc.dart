import 'dart:async';

import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/usecases/auth/auth_usecase.dart';
import '../../../../base/base.dart';

part 'signin_event.dart';
part 'signin_state.dart';

@Injectable()
class SigninBloc extends AppBlocBase<SigninEvent, SigninState> {
  final AuthUsecase _authUsecase;

  SigninBloc(
    this._authUsecase,
  ) : super(
          SigninInitial(
            data: const _StateData(),
          ),
        ) {
    on<LoginEvent>(_onLoginEvent);
  }

  Future<void> _onLoginEvent(
    LoginEvent event,
    Emitter<SigninState> emit,
  ) async {
    final res = await _authUsecase.login(
      username: event.username,
      password: event.password,
    );
    if (res) {
      emit(state.copyWith<LoginSuccess>());
    }
  }
}
