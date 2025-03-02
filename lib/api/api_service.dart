import 'package:socials_app_flutter/api/social_brands_api.dart';
import 'package:socials_app_flutter/api/socialbrands_api_client.dart';

const String BASE_URL = 'https://indexcodex.com/api/v1';

class ApiService {
  SocialBrandsApi get brandsApi => _brandsApi ??= SocialBrandsApi(
      _createApiClient('https://indexcodex.com/api/v1/socials'));

  SocialBrandsApi get loginApi => _loginApi ??= SocialBrandsApi(
      _createApiClient('https://indexcodex.com/api/v1/login'));

  ApiClient _createApiClient(String baseUrl) => ApiClient(
        baseUrl: BASE_URL,
        onInvalidToken: _onInvalidToken,
      );

  void _onInvalidToken({Error? error}) {
    // TODO: handle error here
  }

  SocialBrandsApi? _brandsApi;
  SocialBrandsApi? _loginApi;
}
