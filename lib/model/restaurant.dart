import 'package:json_annotation/json_annotation.dart';

import 'restaurant_promo.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  int id;
  String name;
  List<String>? images;
  int? rating;
  String? cuisine;
  int? distance;
  int? deliveryTime;
  String? priceRange;
  String? featuredPromo;
  bool isPureVeg;
  String? address;
  int? reviews;
  List<RestaurantPromo>? promos;

  Restaurant({
    this.id = 0,
    this.name = "",
    this.images,
    this.rating,
    this.cuisine,
    this.distance,
    this.deliveryTime,
    this.priceRange,
    this.featuredPromo,
    this.isPureVeg = true,
    this.address,
    this.reviews,
    this.promos,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
