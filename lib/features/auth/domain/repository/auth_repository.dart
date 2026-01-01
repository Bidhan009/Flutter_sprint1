import 'package:dartz/dartz.dart';
import 'package:gamezone_flutter/core/error/failure.dart';
import 'package:gamezone_flutter/features/auth/domain/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<Either<Failure, void>> registerUser(UserEntity user);
  Future<Either<Failure, void>> loginUser(String username, String password);
}
