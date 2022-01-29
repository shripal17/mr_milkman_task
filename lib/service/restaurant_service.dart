import 'package:milkman_task/model/general_response.dart';
import 'package:milkman_task/model/restaurant.dart';
import 'package:milkman_task/model/restaurant_menu_item.dart';

import 'api/base_api.dart';
import 'api/restaurant_api.dart';

class RestaurantService with BaseApi {
  late RestaurantApi _restaurantApi;

  RestaurantService() {
    _restaurantApi = RestaurantApi();
  }

  Future<GeneralResponse<List<Restaurant>>> getRestaurants() => loadResponse(() => _restaurantApi.getRestaurants());

  Future<GeneralResponse<List<RestaurantMenuItem>>> getRestaurantMenu(int restaurantId) => loadResponse(() => _restaurantApi.getRestaurantMenu(restaurantId));
}
