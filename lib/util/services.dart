import 'package:milkman_task/service/restaurant_service.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final _restaurantService = RM.inject(() => RestaurantService());

RestaurantService get restaurantService => _restaurantService.state;
