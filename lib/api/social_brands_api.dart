import 'package:socials_app_flutter/api/authentication_handler.dart';
import 'package:socials_app_flutter/api/brands_handler.dart';
import 'package:socials_app_flutter/api/socialbrands_api_client.dart';

class SocialBrandsApi {
  SocialBrandsApi(ApiClient apiClient) {
    _init(apiClient);
  }

  void _init(ApiClient apiClient) {
    _brandsApi = DataBrandsApi(apiClient);
    _loginApi = AuthenticationApi(apiClient);
  }

  DataBrandsApi get brandsApi => _brandsApi;
  AuthenticationApi get loginApi => _loginApi;

  late DataBrandsApi _brandsApi;
  late AuthenticationApi _loginApi;
}
