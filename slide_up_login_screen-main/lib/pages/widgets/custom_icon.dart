
import 'package:flutter/material.dart';
import 'package:slide_up_login/widgets/swap_icon.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(27),
        child: const SizedBox(
          width: 50,
          height: 50,
          child: AnimatedAlignExampleApp(),
        ),
      ), //AnimatedAlignExample(),
    );
  }
}