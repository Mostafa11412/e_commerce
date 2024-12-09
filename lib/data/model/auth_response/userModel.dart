import 'package:e_commerce/domain/entities/authEntity/userEntity.dart';

class UserModel {
  String? name;
  String? email;

  UserModel({this.name, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
 
  }

  static List<UserModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    return _data;
  }

  UserEntity toUserEntity() {
    return UserEntity(email: email, name: name);
  }
}
