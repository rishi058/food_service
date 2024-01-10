import 'package:flutter/material.dart';
import 'package:food_delivery/dynamic_size.dart';

Widget displayLocation(String? text){
  return Container(
        width: double.infinity,
        height: 21.h,
        margin: EdgeInsets.symmetric(horizontal: 19.w, vertical: 14.h),
        child: text==null ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 160.w),
            child: const CircularProgressIndicator(strokeWidth: 3))
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, size: 14.sp),
            SizedBox(width: 1.w),
            Flexible(child: Text(text, overflow: TextOverflow.ellipsis)),
          ],
        ),
  );
}