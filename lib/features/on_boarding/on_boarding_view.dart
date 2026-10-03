import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:markti/features/auth/views/sign_in_view.dart';
import 'package:markti/features/on_boarding/widgets/create_custom_view_model.dart';
import 'package:markti/features/on_boarding/widgets/on_boarding_page.dart';

class OnboardingView extends StatefulWidget {
  OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.height;
    // final double height = MediaQuery.of(context).size.height;
    // log('Screen height: $height');
    return Scaffold(
        body: Stack(
      children: [
        IntroductionScreen(
          // scrollPhysics: NeverScrollableScrollPhysics(),
          dotsDecorator: DotsDecorator(
            activeColor: Colors.blue,
            size: Size(10, 10),
            activeSize: Size(22, 10),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          key: _introKey,
          //
          onChange: (value) {
            print('Current page: $value');
            currentPage = value;
            setState(() {});
          },
          controlsPosition: Position(
            left: 0,
            right: 0,
            bottom: 60.h, // Move controls (dots + buttons) up
          ),
          showNextButton: false,

          showDoneButton: false,
          next: ElevatedButton(
            onPressed: () {},
            child: Text('next'),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(double.infinity, 80),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
          pages: [
            createCustomViewModel(
              imagePath: 'assets/images/onboarding_1.png',
              title: 'Welcome to Markti',
              description:
                  'Discover a world of endless possibilities and shop from the comfort of your fingertips. Browse through a wide range of products, from fashion and electronics to home.',
            ),
            createCustomViewModel(
              imagePath: 'assets/images/onboarding_2.png',
              title: 'Seamless Shopping Experience',
              description:
                  'Experience a seamless and convenient shopping journey with our user-friendly interface. Effortlessly navigate through categories, search for products, and enjoy a smooth checkout process.',
            ),
            createCustomViewModel(
              imagePath: 'assets/images/onboarding_3.png',
              title: 'Secure and Reliable',
              description:
                  'Shop with confidence knowing that your personal information and transactions are protected with the highest level of security. We prioritize your privacy and ensure a safe shopping environment.',
            ),
          ],
        ),
        Positioned(
          bottom: 20.h,
          left: 20,
          right: 20,
          child: ElevatedButton(

            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: Size(400, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0))),
            child: Text(currentPage == 2 ? 'Get Started' : 'Next',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            onPressed: () {
              if (currentPage == 0 || currentPage == 1) {
                _introKey.currentState?.next();
              } else if (currentPage == 2) {
                Navigator.pushReplacementNamed(context, SignInView.routeName);
              }
              // Navigate to the next page
            },
          ),
        )
      ],
    ));
  }
}
