import 'package:flutter/material.dart';
import 'package:food_delivery/color_scheme/color_pallete.dart';
import 'package:food_delivery/dynamic_size.dart';

Widget customChip(String text, String icon, bool isSelected) {
  return Card(
      elevation: 4,
      color: isSelected ? CustomColors.primaryPink : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(20.sp), // Adjust the value as needed
      ),
      child: Row(
        children: [
          text == 'All'
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 18.w),
                  child: Text(text,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      )),
                )
              : !isSelected
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
                      child: Image.asset(
                        icon,
                      ),
                    )
                  : Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 8.w, top: 4.h, bottom: 4.h),
                          child: Image.asset(
                            icon,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, bottom: 10.h, right: 15.w, left: 5.w),
                          child: Text(text,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              )),
                        )
                      ],
                    ),
        ],
      ));
}
