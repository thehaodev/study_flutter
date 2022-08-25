import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HelloPanel extends StatelessWidget {
  const HelloPanel({
    Key? key,
    required this.userName,
  }) : super(key: key);

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText(
          text: 'Hello $userName 🥰',
          size: 26,
          fontWeight: FontWeight.w600,
        ),
        const CustomText(
          text: 'Lets gets somethings?',
          textColor: Colors.grey,
        ),
      ],
    );
  }
}
