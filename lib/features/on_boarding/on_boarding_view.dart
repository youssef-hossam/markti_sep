import 'package:flutter/material.dart';
import 'package:markti/features/on_boarding/widgets/on_boarding_page.dart';
import 'package:onboarding/onboarding.dart';

class OnbardingView extends StatelessWidget {
  const OnbardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Onboarding(
            swipeableBody: [
          OnBoardingPage(
            imagePath: 'assets/images/onboarding_1.png',
            title: 'Welcome to Markti',
            description:
                'Discover a world of endless possibilities and shop from the comfort of your fingertips. Browse through a wide range of products, from fashion and electronics to home.',
          ),
          OnBoardingPage(
            imagePath: 'assets/images/onboarding_2.png',
            title: 'Welcome to Markti',
            description:
                'Discover a world of endless possibilities and shop from the comfort of your fingertips. Browse through a wide range of products, from fashion and electronics to home.',
          ),
          OnBoardingPage(
            imagePath: 'assets/images/onboarding_3.png',
            title: 'Welcome to Markti',
            description:
                'Discover a world of endless possibilities and shop from the comfort of your fingertips. Browse through a wide range of products, from fashion and electronics to home.',
          ),
          // const Text('Page 2'),
          // const Text('Page 3')
        ] //[List<Widget>] - List of swipeable widgets
            ,
            startIndex: 0, //[int] - the starting index of the swipeable widgets
            onPageChanges:
                (netDragDistance, pagesLength, currentIndex, slideDirection) {
              //1) [pagesLength] The drage distance from swipping
              //2) [pagesLength] The length of the swipeable widgets
              //3) [currentIndex] The currect index
              //4) [slideDirection] The slide direction
            },
            // buildHeader:(context, netDragDistance, pagesLength, currentIndex, setIndex, slideDirection){
            //   //Use this to build a header in your onboarding that will display at all times. (Used to build routing buttons, indicators, etc)
            //   //This is same as onPageChanges but with [setIndex] added to allow u to change the index from this header
            // },
            // buildFooter:(context, netDragDistance, pagesLength, currentIndex, setIndex, slideDirection){
            //   re
            //   //Use this to build a footer in your onboarding that will display at all times. (Used to build routing buttons, indicators, etc)
            // },
            animationInMilliseconds: 300 //[int] - the speed of animations in ms
            ));
  }
}
