import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/user_entity.dart';

// This ID must be unique for every model you create
part 'auth_hive_model.g.dart'; // This will be generated later

@HiveType(typeId: 0)
class AuthHiveModel {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String fname;
  @HiveField(2)
  final String lname;
  @HiveField(3)
  final String phone;
  @HiveField(4)
  final String username;
  @HiveField(5)
  final String password;

  AuthHiveModel({
    String? userId,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.username,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // Initial constructor
  AuthHiveModel.initial()
      : userId = '',
        fname = '',
        lname = '',
        phone = '',
        username = '',
        password = '';

  // Convert Entity to Model (To save to Hive)
  factory AuthHiveModel.fromEntity(UserEntity entity) {
    return AuthHiveModel(
      userId: entity.id,
      fname: entity.fname,
      lname: entity.lname,
      phone: entity.phone,
      username: entity.username,
      password: entity.password,
    );
  }

  // Convert Model to Entity (To use in UI/Logic)
  UserEntity toEntity() {
    return UserEntity(
      id: userId,
      fname: fname,
      lname: lname,
      phone: phone,
      username: username,
      password: password,
    );
  }
}