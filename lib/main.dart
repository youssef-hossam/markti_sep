import 'package:flutter/material.dart';
import 'package:markti/features/home/home_view.dart';

void main() {
  runApp(Markti());
}

class Markti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homeview());
  }
}
