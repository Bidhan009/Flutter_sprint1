import 'package:dartz/dartz.dart';
import 'package:gamezone_flutter/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:gamezone_flutter/features/auth/data/model/auth_hive_model.dart';
import 'package:gamezone_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:gamezone_flutter/features/auth/domain/repository/auth_repository.dart';
import '../../../../core/error/failure.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);

  @override
  Future<Either<Failure, void>> registerUser(UserEntity user) async {
    try {
      final hiveModel = AuthHiveModel.fromEntity(user);
      await _authLocalDataSource.registerUser(hiveModel);
      return const Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> loginUser(String username, String password) async {
    try {
      final userModel = await _authLocalDataSource.loginUser(username, password);
      if (userModel != null) {
        return const Right(true);
      } else {
        return Left(LocalDatabaseFailure(message: "Invalid credentials"));
      }
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }
}