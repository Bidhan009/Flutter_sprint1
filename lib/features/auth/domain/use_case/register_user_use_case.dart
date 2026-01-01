import 'package:dartz/dartz.dart';
import 'package:gamezone_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:gamezone_flutter/features/auth/domain/repository/auth_repository.dart';
import '../../../../core/error/failure.dart';

class RegisterUseCase {
  final IAuthRepository repository;

  RegisterUseCase({required this.repository});

  Future<Either<Failure, void>> call(UserEntity user) {
    return repository.registerUser(user);
  }
}