import 'package:e_commerce/domain/entities/paymentEntity/payment_key_entity.dart';

class PaymentKeyModel {
  String? detail;
  String? token;

  PaymentKeyModel({this.detail, this.token});

  PaymentKeyModel.fromJson(Map<String, dynamic> json) {
    if (json["detail"] is String) {
      detail = json["detail"];
    }
    if (json["token"] is String) {
      token = json["token"];
    }
  }

  static List<PaymentKeyModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(PaymentKeyModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["detail"] = detail;
    _data["token"] = token;
    return _data;
  }

  PaymentKeyEntity toPaymentKeyEntity() {
    return PaymentKeyEntity(token: token);
  }
}
