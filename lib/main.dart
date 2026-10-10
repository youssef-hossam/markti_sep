import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:markti/core/api/api_error_model.dart';
import 'package:markti/core/utils/cache/cache_constants.dart';
import 'package:markti/core/utils/cache/cache_helper.dart';
import 'package:markti/features/auth/sign_in_cubit/sign_in_cubit.dart';
import 'package:markti/features/auth/views/register_view.dart';
import 'package:markti/features/auth/views/sign_in_view.dart';
import 'package:markti/features/home/home_view.dart';
import 'package:markti/features/home/widgets/nav_bar.dart';
import 'package:markti/features/on_boarding/on_boarding_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/features/profile/presentation/views/profile_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
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
          initialRoute:
              CacheHelper.getBool(key: CacheConstants.registerStatus) == true
                  ? '/navBar'
                  : '/Onboarding',
          routes: {
            '/profile': (context) => ProfileView(),
            '/navBar': (context) => NavBar(),
            '/Onboarding': (context) => OnboardingView(),
            SignInView.routeName: (context) => BlocProvider(
                  create: (context) => SignInCubit(),
                  child: SignInView(),
                ),
            '/register': (context) => RegisterView(),
            '/home': (context) => HomeView(),
          },
        ));
  }
}








// {
//     "statusCode": 400,
//     "message": "One or more errors occurred!",
//     "errors": {
//         "generalErrors": [
//             "Invalid email or password."
//         ]
//     }
// }


//{
//     "statusCode": 400,
//     "message": "One or more errors occurred!",
//     "errors": {
//         "password": [
//             "Password must be at least 8 characters.",
//             "Password must contain at least one digit.",
//             "Password must contain at least one special character."
//         ]
//     }
// }