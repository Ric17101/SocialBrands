import 'package:socials_app_flutter/api/social_brands_api.dart';
import 'package:socials_app_flutter/api/socialbrands_api_client.dart';

class ApiService {
  SocialBrandsApi get brandsApi => _brandsApi ??= SocialBrandsApi(
      _createApiClient('https://indexcodex.com/api/v1/socials'));

  ApiClient _createApiClient(String baseUrl) => ApiClient(
        baseUrl: baseUrl,
        onInvalidToken: _onInvalidToken,
      );

  void _onInvalidToken({Error? error}) {
    // TODO: handle error here
  }

  SocialBrandsApi? _brandsApi;
}
