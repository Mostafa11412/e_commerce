import 'package:e_commerce/data/model/auth_response/userModel.dart';
import 'package:e_commerce/domain/entities/authEntity/auth_entity.dart';

class AuthResponse {
  String? message;
  String? statusMsg;
  UserModel? user;
  String? token;

  AuthResponse({this.message, this.statusMsg, this.user, this.token});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["statusMsg"] is String) {
      statusMsg = json["statusMsg"];
    }
    if (json["user"] is Map) {
      user = json["user"] == null ? null : UserModel.fromJson(json["user"]);
    }
    if (json["token"] is String) {
      token = json["token"];
    }
  }

  static List<AuthResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(AuthResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["statusMsg"] = statusMsg;
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    _data["token"] = token;
    return _data;
  }

  AuthEntity toAuthEntity() {
    return AuthEntity(
        message: message, token: token, user: user?.toUserEntity());
  }
}
