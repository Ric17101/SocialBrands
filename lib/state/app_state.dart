import 'package:socials_app_flutter/api/models/data.dart';
import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:socials_app_flutter/api/models/social_brand_model.dart';
import 'package:socials_app_flutter/api/models/user_model.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(Data()) Data data,
    SocialBrandModel? selectedProduct,
    UserModel? user,
    @Default(Wait.empty) @JsonKey(name: 'wait', ignore: true) Wait wait,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  factory AppState.init() => const AppState(
        data: Data(),
      );
}
