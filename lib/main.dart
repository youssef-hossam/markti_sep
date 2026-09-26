import 'package:flutter/material.dart';
import 'package:markti/features/auth/views/sign_in_view.dart';
import 'package:markti/features/home/home_view.dart';
import 'package:markti/features/on_boarding/on_boarding_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(Markti());
}

class Markti extends StatelessWidget {
  const Markti({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(home: SignInView()));
  }
}
