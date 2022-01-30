import 'package:flutter/material.dart';
import 'package:milkman_task/model/restaurant.dart';

extension RestaurantX on Restaurant {
  Color get deliveryIconColor {
    if (deliveryTime < 25) {
      return Colors.green.shade500;
    } else if (deliveryTime < 40) {
      return Colors.green.shade800;
    } else if (deliveryTime < 60) {
      return Colors.amber.shade300;
    } else {
      return Colors.deepOrange.shade300;
    }
  }

  Color get ratingContainerColor {
    if (rating <= 3) {
      return Colors.deepOrange.shade500;
    } else if (rating <= 4) {
      return Colors.green.shade500;
    } else {
      return Colors.green.shade800;
    }
  }
}
