import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/screens/dashbord/bottom_navbar.dart';
import 'package:food_delivery_app/screens/slider/slider_screen.dart';
import 'package:food_delivery_app/screens/slider/tutorial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Food delivery app',
            home: TutorialScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
