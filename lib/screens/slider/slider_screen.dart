import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String short;
  final String image;

  SliderPage(
      {required this.title,
      required this.description,
      required this.image,
      required this.short});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 44.h, left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Center(
                child: Image.asset(
                  image,
                  height: 300.h,
                  width: 187.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Poppins-Light',
                      color: Colors.orange,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 22.h),
              child: Center(
                child: Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Poppins-Light',
                    color: Colors.grey,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Center(
                child: Text(
                  short,
                  style: TextStyle(
                    fontFamily: 'Poppins-Light',
                    color: Colors.grey,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
