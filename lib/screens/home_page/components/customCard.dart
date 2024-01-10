import 'package:flutter/material.dart';
import 'package:food_delivery/color_scheme/color_pallete.dart';
import 'package:food_delivery/dynamic_size.dart';

Widget customCard(String imageUrl, String rating, String name, String discount){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
    child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(10.sp), // Adjust the value as needed
      ),
      elevation: 10,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.5),
                    topRight: Radius.circular(12.5),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 125.h,
              ),
              Positioned(
                bottom: 8.0,
                right: 8.0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CustomColors.primaryGreen,
                  ),
                  child: Text(
                    '$rating ★',
                    style: const TextStyle(
                      color: Colors.white, // Set the color you desire
                      fontSize: 12.0,       // Set the font size you desire
                      fontWeight: FontWeight.bold, // Set the font weight you desire
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name,
                  style: const TextStyle(
                    fontSize: 14.0,       // Set the font size you desire
                    fontWeight: FontWeight.bold, // Set the font weight you desire
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                        height : 25.h,
                        child: Image.asset('assets/discount.png')),
                    Text('$discount% FLAT OFF',
                      style: TextStyle(
                        color: CustomColors.primaryRed,
                        fontSize: 12.0,       // Set the font size you desire
                        fontWeight: FontWeight.bold, // Set the font weight you desire
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}