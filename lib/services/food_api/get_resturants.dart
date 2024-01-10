import 'dart:developer';

import 'package:food_delivery/models/resturant.dart';
import 'package:food_delivery/services/food_api/interceptor.dart';

extension GetRestaurants on FoodApi {

  Future<List<Restaurant>> getRestaurants(String lat, String long) async {
    List<Restaurant> data = [];
    try {
      var query = {'lat': lat, 'lng': long};

      var response = await dio.post('get_resturants', queryParameters: query);
      data = (response.data['data'] as List)
          .map((item) => Restaurant.fromJson(item))
          .toList();

    } catch (e) {
      log(e.toString());
    }
    return data;
  }

}
