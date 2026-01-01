import 'package:equatable/equatable.dart';

// We use Equatable to easily compare two User objects
class UserEntity extends Equatable {
  final String? id;
  final String fname;
  final String lname;
  final String? image;
  final String phone;
  final String username;
  final String password;

  const UserEntity({
    this.id,
    required this.fname,
    required this.lname,
    this.image,
    required this.phone,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [id, fname, lname, image, phone, username, password];
}