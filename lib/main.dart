import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:markti/features/auth/views/register_view.dart';
import 'package:markti/features/auth/views/sign_in_view.dart';
import 'package:markti/features/home/home_view.dart';
import 'package:markti/features/home/widgets/nav_bar.dart';
import 'package:markti/features/on_boarding/on_boarding_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(Markti());
  // getAllProducts();
}

// getAllProducts() async {
//   // Dio dio = Dio();
//   final response = await Dio().get('https://dummyjson.com/products');
//   print('Response data From Api :${response.data}');
// }

class Markti extends StatelessWidget {
  const Markti({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          routes: {
            '/navBar': (context) => NavBar(),
            '/': (context) => OnboardingView(),
            SignInView.routeName: (context) => SignInView(),
            '/register': (context) => RegisterView(),
            '/home': (context) => HomeView(),
          },
        ));
  }
}
