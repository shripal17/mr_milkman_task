// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      rating: json['rating'] as int?,
      cuisine: json['cuisine'] as String?,
      distance: json['distance'] as int?,
      deliveryTime: json['deliveryTime'] as int?,
      priceRange: json['priceRange'] as String?,
      featuredPromo: json['featuredPromo'] as String?,
      isPureVeg: json['isPureVeg'] as bool? ?? true,
      address: json['address'] as String?,
      reviews: json['reviews'] as int?,
      promos: (json['promos'] as List<dynamic>?)
          ?.map((e) => RestaurantPromo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'rating': instance.rating,
      'cuisine': instance.cuisine,
      'distance': instance.distance,
      'deliveryTime': instance.deliveryTime,
      'priceRange': instance.priceRange,
      'featuredPromo': instance.featuredPromo,
      'isPureVeg': instance.isPureVeg,
      'address': instance.address,
      'reviews': instance.reviews,
      'promos': instance.promos,
    };
