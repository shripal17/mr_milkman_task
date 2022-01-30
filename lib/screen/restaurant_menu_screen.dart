import 'package:flutter/material.dart';
import 'package:milkman_task/model/restaurant.dart';
import 'package:milkman_task/model/restaurant_menu_item.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class RestaurantMenuScreen extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantMenuScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  _RestaurantMenuScreenState createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  final _menuItemsIN = RM.inject<List<RestaurantMenuItem>?>(() => null);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
