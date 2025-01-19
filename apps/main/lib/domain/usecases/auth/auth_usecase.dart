import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../data/data_source/remote/auth/auth_repository.dart';

part 'auth_usecase.impl.dart';

abstract class AuthUsecase {
  Future<bool> login({
    required String username,
    required String password,
  });
}
