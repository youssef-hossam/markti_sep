import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkipButton extends StatelessWidget {
  
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      child: Container(
        width: 55.w,
        height: 44.h,
        // color: Colors.red,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
          border: Border.all(
            color: Colors.blue,
            width: 1.0,
          ),
        ),

        child: Center(
            child: Text(
          "Skip",
          style: TextStyle(color: Colors.blue, fontSize: 16.sp),
        )),
      ),
    );
  }
}
