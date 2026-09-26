import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel createCustomViewModel({
  required String imagePath,
  required String title,
  required String description,
}) {
  return PageViewModel(
    decoration: PageDecoration(
      // bodyFlex: 1,

      imageFlex: 2,
      titlePadding: EdgeInsets.only(top: 16.h, bottom: 4.h),
      titleTextStyle: TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.bold,
      ),

      // imageAlignment: Alignment.
    ),

    image: Column(
      children: [
        SizedBox(
          height: 130.h,
        ),
        Image.asset(
          imagePath,
          height: 275.h,
          fit: BoxFit.cover,
        ),
      ],
    ),
    bodyWidget: Text(
      description,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.grey[600],
      ),
    ),

    // title: 'Welcome to Markti',
    titleWidget: Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
