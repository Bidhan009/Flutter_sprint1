import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/auth/data/model/auth_hive_model.dart';

class HiveService {
  static const String userBoxName = 'userBox';

  // 1. Initialize Hive and Register Adapters
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register the adapter we generated earlier
    Hive.registerAdapter(AuthHiveModelAdapter());
  }

  // 2. Register User
  Future<void> register(AuthHiveModel user) async {
    var box = await Hive.openBox<AuthHiveModel>(userBoxName);
    await box.put(user.username, user);
  }

  // 3. Login User
  Future<AuthHiveModel?> login(String username, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(userBoxName);
    var user = box.get(username);
    if (user != null && user.password == password) {
      return user;
    }
    return null;
  }
}