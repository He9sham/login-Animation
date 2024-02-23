import 'package:flutter/material.dart';

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
