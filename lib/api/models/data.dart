import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:socials_app_flutter/api/models/social_brand_model.dart';

part 'data.freezed.dart';

part 'data.g.dart';

/// Entity that represents overall data from brandss endpoint
@freezed
class Data with _$Data {
  /// Initializes a new instance of the [Data] class
  const factory Data({
    @Default(<SocialBrandModel>[]) List<SocialBrandModel> brands,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
