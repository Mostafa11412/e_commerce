import 'package:e_commerce/domain/entities/paymentEntity/order_id_entity.dart';

class OrderIdModel {
  String? detail;
  int? id;
  String? createdAt;
  bool? deliveryNeeded;
  Merchant? merchant;
  dynamic collector;
  int? amountCents;
  dynamic shippingData;
  String? currency;
  bool? isPaymentLocked;
  bool? isReturn;
  bool? isCancel;
  bool? isReturned;
  bool? isCanceled;
  dynamic merchantOrderId;
  dynamic walletNotification;
  int? paidAmountCents;
  bool? notifyUserWithEmail;
  List<dynamic>? items;
  String? orderUrl;
  int? commissionFees;
  int? deliveryFeesCents;
  int? deliveryVatCents;
  String? paymentMethod;
  dynamic merchantStaffTag;
  String? apiSource;
  Data? data;
  String? token;
  String? url;

  OrderIdModel(
      {this.detail,
      this.id,
      this.createdAt,
      this.deliveryNeeded,
      this.merchant,
      this.collector,
      this.amountCents,
      this.shippingData,
      this.currency,
      this.isPaymentLocked,
      this.isReturn,
      this.isCancel,
      this.isReturned,
      this.isCanceled,
      this.merchantOrderId,
      this.walletNotification,
      this.paidAmountCents,
      this.notifyUserWithEmail,
      this.items,
      this.orderUrl,
      this.commissionFees,
      this.deliveryFeesCents,
      this.deliveryVatCents,
      this.paymentMethod,
      this.merchantStaffTag,
      this.apiSource,
      this.data,
      this.token,
      this.url});

  OrderIdModel.fromJson(Map<String, dynamic> json) {
    if (json["detail"] is String) {
      detail = json["detail"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["delivery_needed"] is bool) {
      deliveryNeeded = json["delivery_needed"];
    }
    if (json["merchant"] is Map) {
      merchant =
          json["merchant"] == null ? null : Merchant.fromJson(json["merchant"]);
    }
    collector = json["collector"];
    if (json["amount_cents"] is int) {
      amountCents = json["amount_cents"];
    }
    shippingData = json["shipping_data"];
    if (json["currency"] is String) {
      currency = json["currency"];
    }
    if (json["is_payment_locked"] is bool) {
      isPaymentLocked = json["is_payment_locked"];
    }
    if (json["is_return"] is bool) {
      isReturn = json["is_return"];
    }
    if (json["is_cancel"] is bool) {
      isCancel = json["is_cancel"];
    }
    if (json["is_returned"] is bool) {
      isReturned = json["is_returned"];
    }
    if (json["is_canceled"] is bool) {
      isCanceled = json["is_canceled"];
    }
    merchantOrderId = json["merchant_order_id"];
    walletNotification = json["wallet_notification"];
    if (json["paid_amount_cents"] is int) {
      paidAmountCents = json["paid_amount_cents"];
    }
    if (json["notify_user_with_email"] is bool) {
      notifyUserWithEmail = json["notify_user_with_email"];
    }
    if (json["items"] is List) {
      items = json["items"] ?? [];
    }
    if (json["order_url"] is String) {
      orderUrl = json["order_url"];
    }
    if (json["commission_fees"] is int) {
      commissionFees = json["commission_fees"];
    }
    if (json["delivery_fees_cents"] is int) {
      deliveryFeesCents = json["delivery_fees_cents"];
    }
    if (json["delivery_vat_cents"] is int) {
      deliveryVatCents = json["delivery_vat_cents"];
    }
    if (json["payment_method"] is String) {
      paymentMethod = json["payment_method"];
    }
    merchantStaffTag = json["merchant_staff_tag"];
    if (json["api_source"] is String) {
      apiSource = json["api_source"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if (json["token"] is String) {
      token = json["token"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
  }

  static List<OrderIdModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(OrderIdModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["detail"] = detail;
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["delivery_needed"] = deliveryNeeded;
    if (merchant != null) {
      _data["merchant"] = merchant?.toJson();
    }
    _data["collector"] = collector;
    _data["amount_cents"] = amountCents;
    _data["shipping_data"] = shippingData;
    _data["currency"] = currency;
    _data["is_payment_locked"] = isPaymentLocked;
    _data["is_return"] = isReturn;
    _data["is_cancel"] = isCancel;
    _data["is_returned"] = isReturned;
    _data["is_canceled"] = isCanceled;
    _data["merchant_order_id"] = merchantOrderId;
    _data["wallet_notification"] = walletNotification;
    _data["paid_amount_cents"] = paidAmountCents;
    _data["notify_user_with_email"] = notifyUserWithEmail;
    if (items != null) {
      _data["items"] = items;
    }
    _data["order_url"] = orderUrl;
    _data["commission_fees"] = commissionFees;
    _data["delivery_fees_cents"] = deliveryFeesCents;
    _data["delivery_vat_cents"] = deliveryVatCents;
    _data["payment_method"] = paymentMethod;
    _data["merchant_staff_tag"] = merchantStaffTag;
    _data["api_source"] = apiSource;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    _data["token"] = token;
    _data["url"] = url;
    return _data;
  }

  OrderIdEntity toOrderIdEntity() {
    return OrderIdEntity(
        amountCents: amountCents,
        currency: currency,
        id: id,
        shippingData: shippingData);
  }
}

class Data {
  Data();

  Data.fromJson(Map<String, dynamic> json) {}

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map(Data.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    return _data;
  }
}

class Merchant {
  int? id;
  String? createdAt;
  List<String>? phones;
  List<String>? companyEmails;
  String? companyName;
  String? state;
  String? country;
  String? city;
  String? postalCode;
  String? street;

  Merchant(
      {this.id,
      this.createdAt,
      this.phones,
      this.companyEmails,
      this.companyName,
      this.state,
      this.country,
      this.city,
      this.postalCode,
      this.street});

  Merchant.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if (json["phones"] is List) {
      phones =
          json["phones"] == null ? null : List<String>.from(json["phones"]);
    }
    if (json["company_emails"] is List) {
      companyEmails = json["company_emails"] == null
          ? null
          : List<String>.from(json["company_emails"]);
    }
    if (json["company_name"] is String) {
      companyName = json["company_name"];
    }
    if (json["state"] is String) {
      state = json["state"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
    if (json["city"] is String) {
      city = json["city"];
    }
    if (json["postal_code"] is String) {
      postalCode = json["postal_code"];
    }
    if (json["street"] is String) {
      street = json["street"];
    }
  }

  static List<Merchant> fromList(List<Map<String, dynamic>> list) {
    return list.map(Merchant.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    if (phones != null) {
      _data["phones"] = phones;
    }
    if (companyEmails != null) {
      _data["company_emails"] = companyEmails;
    }
    _data["company_name"] = companyName;
    _data["state"] = state;
    _data["country"] = country;
    _data["city"] = city;
    _data["postal_code"] = postalCode;
    _data["street"] = street;
    return _data;
  }
}
