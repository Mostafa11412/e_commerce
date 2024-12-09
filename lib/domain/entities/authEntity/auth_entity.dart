import 'package:e_commerce/domain/entities/authEntity/userEntity.dart';

class AuthEntity {
  String? message;
  UserEntity? user;
  String? token;

  AuthEntity({this.message, this.user, this.token});
}
