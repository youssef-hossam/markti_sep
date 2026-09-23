import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  const OnBoardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 164,
          ),
          Image.asset(
            imagePath,
            // width: 200,
            width: double.infinity,
            // fit: BoxFit.cover,
            height: 256,
          ),
          SizedBox(
            height: 54,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 26,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ),
          SizedBox(
            height: 87,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                backgroundColor: Colors.blue,
                fixedSize: Size(347, 50)),
            onPressed: () {
              // Navigate to the next page
            },
            child: Text('Get Started',
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
