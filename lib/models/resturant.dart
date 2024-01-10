import 'package:flutter/foundation.dart';

class Restaurant {
  final int id;
  final String name;
  final String tags;
  final double rating;
  final int discount;
  final String primaryImage;
  final double distance;

  // Constructor
  Restaurant({
    required this.id,
    required this.name,
    required this.tags,
    required this.rating,
    required this.discount,
    required this.primaryImage,
    required this.distance,
  });

  // Factory method to create a Restaurant instance from JSON data
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] as int,
      name: json['name'] as String,
      tags: json['tags'] as String,
      rating: json['rating'] as double,
      discount: json['discount'] as int,
      primaryImage: json['primary_image'] as String,
      distance: json['distance'] as double,
    );
  }

  // Method to print restaurant details
  void printDetails() {
   if(kDebugMode){
     print('Restaurant Details:');
     print('ID: $id');
     print('Name: $name');
     print('Tags: $tags');
     print('Rating: $rating');
     print('Discount: $discount%');
     print('Primary Image URL: $primaryImage');
     print('Distance: $distance');
   }
  }
}