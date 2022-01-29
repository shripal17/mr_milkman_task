import 'package:json_annotation/json_annotation.dart';

part 'restaurant_promo.g.dart';

@JsonSerializable()
class RestaurantPromo {
  String? title;
  String code;
  String? description;

  RestaurantPromo({this.title, this.code = "", this.description});

  factory RestaurantPromo.fromJson(Map<String, dynamic> json) => _$RestaurantPromoFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantPromoToJson(this);
}
