import 'package:flutter/material.dart';
import 'package:food_delivery/color_scheme/color_pallete.dart';

class CustomGradientContainer extends StatelessWidget {
  final Widget child;
  const CustomGradientContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [CustomColors.backgroundColor, Colors.white, Colors.white])),
      child: child,
    );
  }
}
