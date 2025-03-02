import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_brand_item_ui.freezed.dart';

@freezed
class SocialBrandItemUi with _$SocialBrandItemUi {
  const factory SocialBrandItemUi({
    int? id,
    @Default('') String name,
    @Default('') String history,
    @Default('') String iconUrl,
    @Default('') String imgUrl,
    @Default('') String webUrl,
    Color? color,
  }) = _SocialBrandItemUi;

  const SocialBrandItemUi._();

  factory SocialBrandItemUi.init() => const SocialBrandItemUi();
}
