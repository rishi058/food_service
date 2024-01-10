import 'package:flutter/material.dart';
import 'package:food_delivery/dynamic_size.dart';
import 'package:food_delivery/screens/bottom_navigation/bottom_navigation.dart';
import 'package:food_delivery/screens/home_page/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    DeviceDimension.width = MediaQuery.of(context).size.width;
    DeviceDimension.height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.pink,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const BottomNavigation(),
    );
  }
}

