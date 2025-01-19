part of 'auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return Future.value('token');
  }
}
