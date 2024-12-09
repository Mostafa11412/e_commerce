import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_Manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/data/dao/dataSourceContract/payment_dataSource/payment_dataSource.dart';
import 'package:e_commerce/data/model/payment_response/auth_token_model.dart';
import 'package:e_commerce/data/model/payment_response/order_id_model.dart';
import 'package:e_commerce/data/model/payment_response/payment_key_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentDataSource)
class PaymentDatasourceImpl extends PaymentDataSource {
  ApiManager apiManager;
  @factoryMethod
  PaymentDatasourceImpl(this.apiManager);

  @override
  Future<Either<AuthTokenModel, String>> getAuthToken() async {
    try {
      var response = await apiManager.postData(
          EndPoints.authToken, Constants.PaymentBaseUrl,
          body: {"api_key": Constants.PaymentApiKey});
      AuthTokenModel authTokenModel = AuthTokenModel.fromJson(response.data);

      return Left(authTokenModel);
    } catch (error) {
      print(error);
      return (Right(error.toString()));
    }
  }

  @override
  Future<Either<OrderIdModel, String>> getOrderId(
      {required String authToken, required int amount}) async {
    try {
      var response = await apiManager
          .postData(EndPoints.orderId, Constants.PaymentBaseUrl, body: {
        "auth_token": authToken,
        "delivery_needed": false,
        "amount_cents": amount.toString(),
        "currencey": "Egp",
        "items": []
      });
      OrderIdModel orderIdModel = OrderIdModel.fromJson(response.data);
      if (orderIdModel.detail != null) {
        return Right(orderIdModel.detail!);
      }
      return Left(orderIdModel);
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<PaymentKeyModel, String>> getPaymentKey({
    required String authToken,
    required String orderId,
    required int amount,
    required String email,
    required String first_name,
    required String phone_number,
    required String last_name,
  }) async {
    try {
      var response = await apiManager
          .postData(EndPoints.payment_keys, Constants.PaymentBaseUrl, body: {
        "auth_token": authToken,
        "order_id": orderId,
        "amount_cents": amount.toString(),
        "expiration": "2500",
        "currency": "EGP",
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": first_name,
          "street": "NA",
          "building": "NA",
          "phone_number": phone_number,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "EG",
          "last_name": last_name,
          "state": "NA"
        },
        "integration_id": 4895435
      });

      PaymentKeyModel paymentKeyModel = PaymentKeyModel.fromJson(response.data);
      if (paymentKeyModel.detail != null) {
        return Right(paymentKeyModel.detail!);
      }
      return Left(paymentKeyModel);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
