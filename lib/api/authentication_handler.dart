import 'dart:convert';

import 'package:socials_app_flutter/api/models/user_model.dart';
import 'package:socials_app_flutter/api/socialbrands_api_client.dart';

class AuthenticationApi {
  final ApiClient apiClient;

  AuthenticationApi(this.apiClient);

  /// Authentication
  /// HTTP Code 200: Login
  /// https://indexcodex.com/api/v1/login
  Future<UserModel> login(String username, String pin) async {
    final queryParams = <String, dynamic>{
      "userName": username,
      "otp": int.parse(pin),
    };

    return await apiClient.dio
        .post('/login', data: jsonEncode(queryParams))
        .then((response) {
      return UserModel.fromJson(response.data);
    });
  }
}
