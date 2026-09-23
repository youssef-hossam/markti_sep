import 'package:flutter/material.dart';
import 'package:markti/features/home/home_view.dart';
import 'package:markti/features/on_boarding/on_boarding_view.dart';

void main() {
  runApp(Markti());
}

class Markti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: OnbardingView());
  }
}
