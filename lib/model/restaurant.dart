import 'package:json_annotation/json_annotation.dart';

import 'restaurant_promo.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant {
  int id;
  String name;
  List<String>? images;
  @JsonKey(name: 'rating')
  int? _rating;
  String? cuisine;
  @JsonKey(name: 'distance')
  int? _distance;
  @JsonKey(name: 'deliveryTime')
  int? _deliveryTime;
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
    int? rating,
    this.cuisine,
    int? distance,
    int? deliveryTime,
    this.priceRange,
    this.featuredPromo,
    this.isPureVeg = true,
    this.address,
    this.reviews,
    this.promos,
  }) {
    if (rating != null) {
      _rating = rating /** 200*/;
    }
    if (distance != null) {
      _distance = distance /* * 100*/;
    }
    if (deliveryTime != null) {
      _deliveryTime = deliveryTime /* * 10*/;
    }
  }

  // API gives us rating as random number from 0 to 1000, hence mapping it to 0-5
  double get rating => ((_rating ?? 0) / 100) / 2;

  // API gives us distance as random number from 0 to 1000, hence mapping it to 0-10
  int get distance => ((_distance ?? 0) / 100).round();

  // API gives us deliveryTime as random number from 0 to 1000, hence mapping it to 0-100
  int get deliveryTime => ((_deliveryTime ?? 0) / 10).round();

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
