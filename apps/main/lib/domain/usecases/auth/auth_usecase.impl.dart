part of 'auth_usecase.dart';

@Injectable(as: AuthUsecase)
class AuthInteractorImpl extends AuthUsecase {
  final AuthRepository _repository;

  AuthInteractorImpl(
    this._repository,
  );

  @override
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    final token = await _repository.signInWithEmailAndPassword(
      email: username,
      password: password,
    );
    if (token.isNotEmpty) {
      // TODO: Save token to local storage
      return true;
    }
    return false;
  }
}
