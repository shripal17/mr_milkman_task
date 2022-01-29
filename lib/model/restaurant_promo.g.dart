// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_promo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantPromo _$RestaurantPromoFromJson(Map<String, dynamic> json) =>
    RestaurantPromo(
      title: json['title'] as String?,
      code: json['code'] as String? ?? "",
      description: json['description'] as String?,
    );

Map<String, dynamic> _$RestaurantPromoToJson(RestaurantPromo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'code': instance.code,
      'description': instance.description,
    };
