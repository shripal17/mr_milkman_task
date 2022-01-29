// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantMenuItem _$RestaurantMenuItemFromJson(Map<String, dynamic> json) =>
    RestaurantMenuItem(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      price: json['price'] as int? ?? 0,
      image: json['image'] as String?,
      rating: json['rating'] as int?,
      noOfRatings: json['noOfRatings'] as int?,
      highlightLabel: json['highlightLabel'] as String?,
      isRecommended: json['isRecommended'] as bool?,
      isVegetarian: json['isVegetarian'] as bool? ?? true,
    );

Map<String, dynamic> _$RestaurantMenuItemToJson(RestaurantMenuItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
      'rating': instance.rating,
      'noOfRatings': instance.noOfRatings,
      'highlightLabel': instance.highlightLabel,
      'isRecommended': instance.isRecommended,
      'isVegetarian': instance.isVegetarian,
    };
