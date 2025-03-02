// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail_ui.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserDetailUi {
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get loginStatus => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;

  /// Create a copy of UserDetailUi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDetailUiCopyWith<UserDetailUi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailUiCopyWith<$Res> {
  factory $UserDetailUiCopyWith(
          UserDetailUi value, $Res Function(UserDetailUi) then) =
      _$UserDetailUiCopyWithImpl<$Res, UserDetailUi>;
  @useResult
  $Res call(
      {String userId,
      String userName,
      String loginStatus,
      String profilePicture});
}

/// @nodoc
class _$UserDetailUiCopyWithImpl<$Res, $Val extends UserDetailUi>
    implements $UserDetailUiCopyWith<$Res> {
  _$UserDetailUiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDetailUi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? loginStatus = null,
    Object? profilePicture = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDetailUiImplCopyWith<$Res>
    implements $UserDetailUiCopyWith<$Res> {
  factory _$$UserDetailUiImplCopyWith(
          _$UserDetailUiImpl value, $Res Function(_$UserDetailUiImpl) then) =
      __$$UserDetailUiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String userName,
      String loginStatus,
      String profilePicture});
}

/// @nodoc
class __$$UserDetailUiImplCopyWithImpl<$Res>
    extends _$UserDetailUiCopyWithImpl<$Res, _$UserDetailUiImpl>
    implements _$$UserDetailUiImplCopyWith<$Res> {
  __$$UserDetailUiImplCopyWithImpl(
      _$UserDetailUiImpl _value, $Res Function(_$UserDetailUiImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDetailUi
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? loginStatus = null,
    Object? profilePicture = null,
  }) {
    return _then(_$UserDetailUiImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserDetailUiImpl extends _UserDetailUi {
  const _$UserDetailUiImpl(
      {this.userId = '',
      this.userName = '',
      this.loginStatus = '',
      this.profilePicture = ''})
      : super._();

  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String loginStatus;
  @override
  @JsonKey()
  final String profilePicture;

  @override
  String toString() {
    return 'UserDetailUi(userId: $userId, userName: $userName, loginStatus: $loginStatus, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailUiImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, userName, loginStatus, profilePicture);

  /// Create a copy of UserDetailUi
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailUiImplCopyWith<_$UserDetailUiImpl> get copyWith =>
      __$$UserDetailUiImplCopyWithImpl<_$UserDetailUiImpl>(this, _$identity);
}

abstract class _UserDetailUi extends UserDetailUi {
  const factory _UserDetailUi(
      {final String userId,
      final String userName,
      final String loginStatus,
      final String profilePicture}) = _$UserDetailUiImpl;
  const _UserDetailUi._() : super._();

  @override
  String get userId;
  @override
  String get userName;
  @override
  String get loginStatus;
  @override
  String get profilePicture;

  /// Create a copy of UserDetailUi
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDetailUiImplCopyWith<_$UserDetailUiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
