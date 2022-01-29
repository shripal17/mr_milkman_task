import 'package:json_annotation/json_annotation.dart';

part 'restaurant_menu_item.g.dart';

@JsonSerializable()
class RestaurantMenuItem {
  int id;
  String name;
  int price;
  String? image;
  @JsonKey(name: 'rating')
  int? _rating;
  int? noOfRatings;
  String? highlightLabel;
  bool? isRecommended;
  bool isVegetarian;

  RestaurantMenuItem({
    this.id = 0,
    this.name = "",
    this.price = 0,
    this.image,
    this.noOfRatings,
    this.highlightLabel,
    this.isRecommended,
    this.isVegetarian = true,
    int? rating,
  }) {
    if (rating != null) {
      _rating = rating * 200;
    }
  }

  // API gives us rating as random number from 0 to 1000, hence mapping it to 0-5
  double get rating => (_rating ?? 0 / 100) / 2;

  factory RestaurantMenuItem.fromJson(Map<String, dynamic> json) => _$RestaurantMenuItemFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantMenuItemToJson(this);
}
