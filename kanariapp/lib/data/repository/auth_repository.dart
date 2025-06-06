import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:restapi/data/model/request/auth/login_request_model.dart';
import 'package:restapi/data/model/request/auth/register_request_model.dart';
import 'package:restapi/service/service_http_client.dart';

class AuthRepository {
  final ServiceHttpClient _serviceHttpClient;
  final secureStorage = FlutterSecureStorage();

  AuthRepository(this._serviceHttpClient);

  Future register(RegisterRequestModel requestModel) async {}

  Future login(LoginRequestModel requestModel) async {}
}
