import 'package:json_annotation/json_annotation.dart';

part 'restaurant_menu_item.g.dart';

@JsonSerializable()
class RestaurantMenuItem {
  int id;
  String name;
  int price;
  String? image;
  int? rating;
  int? noOfRatings;
  String? highlightLabel;
  bool? isRecommended;
  bool isVegetarian;

  RestaurantMenuItem({
    this.id = 0,
    this.name = "",
    this.price = 0,
    this.image,
    this.rating,
    this.noOfRatings,
    this.highlightLabel,
    this.isRecommended,
    this.isVegetarian = true,
  });

  factory RestaurantMenuItem.fromJson(Map<String, dynamic> json) => _$RestaurantMenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantMenuItemToJson(this);
}
