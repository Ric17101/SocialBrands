import 'package:socials_app_flutter/api/brands_handler.dart';
import 'package:socials_app_flutter/api/social_brands_api_client.dart';

class SocialBrandsApi {
  SocialBrandsApi(ApiClient apiClient) {
    _init(apiClient);
  }

  void _init(ApiClient apiClient) {
    _brandsApi = DataBrandsApi(apiClient);
  }

  DataBrandsApi get brandsApi => _brandsApi;

  late DataBrandsApi _brandsApi;
}
