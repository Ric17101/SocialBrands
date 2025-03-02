// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      brands: (json['brands'] as List<dynamic>?)
              ?.map((e) => SocialBrandModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SocialBrandModel>[],
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'brands': instance.brands,
    };
