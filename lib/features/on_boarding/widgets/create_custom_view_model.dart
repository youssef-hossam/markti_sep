
  import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel createCustomViewModel(
      {required String imagePath,
      required String title,
      required String description}) {
    return PageViewModel(
      decoration: PageDecoration(
        imageFlex: 2,

        // imageAlignment: Alignment.
      ),

      image: Column(
        children: [
          SizedBox(
            height: 110,
          ),
          Image.asset(
            imagePath,
            height: 350,
            fit: BoxFit.cover,
          ),
        ],
      ),
      bodyWidget: Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[600],
        ),
      ),

      // title: 'Welcome to Markti',
      titleWidget: Column(
        children: [
          // SizedBox(
          //   height: 84,
          // ),
          Text(
            title,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
