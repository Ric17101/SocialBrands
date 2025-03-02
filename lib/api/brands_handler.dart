import 'package:socials_app_flutter/api/models/data.dart';
import 'package:socials_app_flutter/api/models/social_brand_model.dart';
import 'package:socials_app_flutter/api/socialbrands_api_client.dart';

class DataBrandsApi {
  final ApiClient apiClient;

  DataBrandsApi(this.apiClient);

  /// Get all Social Brands
  /// HTTP Code 200: List of Social Brands
  /// https://indexcodex.com/api/v1/socials
  Future<Data> getData() async {
    return await apiClient.dio.get('/socials').then((response) {
      final list = List<SocialBrandModel>.from(
          response.data.map((x) => SocialBrandModel.fromJson(x)));
      return Data(brands: list);
    });
  }
}
