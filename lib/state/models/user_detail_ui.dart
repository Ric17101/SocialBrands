import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail_ui.freezed.dart';

@freezed
class UserDetailUi with _$UserDetailUi {
  const factory UserDetailUi({
    @Default('') String userId,
    @Default('') String userName,
    @Default('') String loginStatus,
    @Default('') String profilePicture,
  }) = _UserDetailUi;

  const UserDetailUi._();

  factory UserDetailUi.init() => const UserDetailUi();
}
