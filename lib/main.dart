import 'package:flutter/material.dart';
import 'package:gamezone_flutter/app/app.dart';
import 'package:gamezone_flutter/app/di/di.dart';
import 'package:gamezone_flutter/core/service/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await locator<HiveService>().init();
  runApp(const App());
}
