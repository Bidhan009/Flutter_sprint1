import 'package:gamezone_flutter/core/service/hive_service.dart';
import '../../model/auth_hive_model.dart';
class AuthLocalDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  Future<void> registerUser(AuthHiveModel user) async {
    await _hiveService.register(user);
  }

  Future<AuthHiveModel?> loginUser(String username, String password) async {
    return await _hiveService.login(username, password);
  }
}