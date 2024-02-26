import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FieldWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function(String) onchanged;
  bool obscureText;
  FieldWidget(
      {super.key,
      this.obscureText = false,
      required this.title,
      required this.icon,
      required this.onchanged});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(25)),
      child: TextFormField(
        // ignore: body_might_complete_normally_nullable
        validator: (data) {
          if (data!.isEmpty) {
            return 'Please enter correct data';
          }
        },
        obscureText: obscureText,
        onChanged: onchanged,
        decoration: InputDecoration(
            hintText: title,
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: Colors.grey,
            )),
      ),
    );
  }
}
