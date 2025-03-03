// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return _AppState.fromJson(json);
}

/// @nodoc
mixin _$AppState {
  Data get data => throw _privateConstructorUsedError;
  SocialBrandModel? get selectedBrand => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'wait', ignore: true)
  Wait get wait => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Event<DialogHandler>? get dialogEvent => throw _privateConstructorUsedError;

  /// Serializes this AppState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {Data data,
      SocialBrandModel? selectedBrand,
      UserModel? user,
      @JsonKey(name: 'wait', ignore: true) Wait wait,
      @JsonKey(ignore: true) Event<DialogHandler>? dialogEvent});

  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? selectedBrand = freezed,
    Object? user = freezed,
    Object? wait = null,
    Object? dialogEvent = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      selectedBrand: freezed == selectedBrand
          ? _value.selectedBrand
          : selectedBrand // ignore: cast_nullable_to_non_nullable
              as SocialBrandModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait,
      dialogEvent: freezed == dialogEvent
          ? _value.dialogEvent
          : dialogEvent // ignore: cast_nullable_to_non_nullable
              as Event<DialogHandler>?,
    ) as $Val);
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Data data,
      SocialBrandModel? selectedBrand,
      UserModel? user,
      @JsonKey(name: 'wait', ignore: true) Wait wait,
      @JsonKey(ignore: true) Event<DialogHandler>? dialogEvent});

  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? selectedBrand = freezed,
    Object? user = freezed,
    Object? wait = null,
    Object? dialogEvent = freezed,
  }) {
    return _then(_$AppStateImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      selectedBrand: freezed == selectedBrand
          ? _value.selectedBrand
          : selectedBrand // ignore: cast_nullable_to_non_nullable
              as SocialBrandModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      wait: null == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait,
      dialogEvent: freezed == dialogEvent
          ? _value.dialogEvent
          : dialogEvent // ignore: cast_nullable_to_non_nullable
              as Event<DialogHandler>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppStateImpl implements _AppState {
  const _$AppStateImpl(
      {this.data = const Data(),
      this.selectedBrand,
      this.user,
      @JsonKey(name: 'wait', ignore: true) this.wait = Wait.empty,
      @JsonKey(ignore: true) this.dialogEvent});

  factory _$AppStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppStateImplFromJson(json);

  @override
  @JsonKey()
  final Data data;
  @override
  final SocialBrandModel? selectedBrand;
  @override
  final UserModel? user;
  @override
  @JsonKey(name: 'wait', ignore: true)
  final Wait wait;
  @override
  @JsonKey(ignore: true)
  final Event<DialogHandler>? dialogEvent;

  @override
  String toString() {
    return 'AppState(data: $data, selectedBrand: $selectedBrand, user: $user, wait: $wait, dialogEvent: $dialogEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.selectedBrand, selectedBrand) ||
                other.selectedBrand == selectedBrand) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.wait, wait) || other.wait == wait) &&
            (identical(other.dialogEvent, dialogEvent) ||
                other.dialogEvent == dialogEvent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, data, selectedBrand, user, wait, dialogEvent);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppStateImplToJson(
      this,
    );
  }
}

abstract class _AppState implements AppState {
  const factory _AppState(
          {final Data data,
          final SocialBrandModel? selectedBrand,
          final UserModel? user,
          @JsonKey(name: 'wait', ignore: true) final Wait wait,
          @JsonKey(ignore: true) final Event<DialogHandler>? dialogEvent}) =
      _$AppStateImpl;

  factory _AppState.fromJson(Map<String, dynamic> json) =
      _$AppStateImpl.fromJson;

  @override
  Data get data;
  @override
  SocialBrandModel? get selectedBrand;
  @override
  UserModel? get user;
  @override
  @JsonKey(name: 'wait', ignore: true)
  Wait get wait;
  @override
  @JsonKey(ignore: true)
  Event<DialogHandler>? get dialogEvent;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
