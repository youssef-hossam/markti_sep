import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

IconData google = SimpleIcons.google;
IconData apple = SimpleIcons.apple;
IconData facebook = SimpleIcons.facebook;

class SocialIconButton extends StatelessWidget {
  final IconData icon_social;
  const SocialIconButton({super.key, required this.icon_social});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(icon_social, color: Color.fromARGB(255, 21, 71, 151)),
        onPressed: () {
          print("awesome platform to share code and ideas");
        });
  }
}
