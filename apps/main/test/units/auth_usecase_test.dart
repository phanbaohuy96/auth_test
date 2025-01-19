import 'package:authentication_test/data/data_source/remote/auth/auth_repository.dart';
import 'package:authentication_test/domain/usecases/auth/auth_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>()])
import 'auth_usecase_test.mocks.dart';

void main() {
  group('Auth Usecase Test', () {
    late AuthUsecase authUsecase;
    final mockAuthRepository = MockAuthRepository();

    setUp(() {
      authUsecase = AuthInteractorImpl(
        mockAuthRepository,
      );
    });

    test('Login success', () async {
      when(
        mockAuthRepository.signInWithEmailAndPassword(
          email: 'username',
          password: 'password',
        ),
      ).thenAnswer((_) async => 'success');

      final res = await authUsecase.login(
        username: 'username',
        password: 'password',
      );

      expect(res, true);
    });

    test('Login failed', () async {
      when(
        mockAuthRepository.signInWithEmailAndPassword(
          email: 'username',
          password: 'password',
        ),
      ).thenAnswer((_) async => '');

      final res = await authUsecase.login(
        username: 'username',
        password: 'password',
      );

      expect(res, false);
    });
  });
}
