import 'package:injectable/injectable.dart';

part 'auth_repository.impl.dart';

abstract class AuthRepository {
  /// Return token if success, otherwise return empty string or throw exception
  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
