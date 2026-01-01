import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repository/auth_repository.dart';

class LoginUseCase {
  final IAuthRepository repository;

  LoginUseCase({required this.repository});

  // This allows you to call the class like a function: loginUseCase(...)
  Future<Either<Failure, void>> call(String username, String password) {
    return repository.loginUser(username, password);
  }
}