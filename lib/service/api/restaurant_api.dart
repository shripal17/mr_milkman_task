import 'package:dio/dio.dart';
import 'package:milkman_task/model/restaurant.dart';
import 'package:milkman_task/model/restaurant_menu_item.dart';
import 'package:milkman_task/util/helpers.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_api.g.dart';

@RestApi(baseUrl: 'https://923a3c00-1388-483e-adb9-d389f84b83c1.mock.pstmn.io/')
abstract class RestaurantApi {
  factory RestaurantApi() => _RestaurantApi(buildDio());

  @GET("restaurants")
  Future<List<Restaurant>> getRestaurants();

  @GET("menu/{restaurantId}")
  Future<List<RestaurantMenuItem>> getRestaurantMenu(@Path() int restaurantId);
}
