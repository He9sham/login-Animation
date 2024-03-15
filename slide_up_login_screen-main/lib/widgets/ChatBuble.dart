// ignore: file_names

import 'package:flutter/material.dart';
import 'package:slide_up_login/models/Messages.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding:
            const EdgeInsets.only(left: 17, top: 16, bottom: 16, right: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          color: Color.fromARGB(255, 86, 41, 163),
        ),
        child: Row(
          children: [
            Text(
              message.message,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Spacer(
              flex: 4,
            ),
            const Text('8:00')
          ],
        ),
      ),
    );
  }
}

class ChatBubleforfrind extends StatelessWidget {
  const ChatBubleforfrind({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding:
            const EdgeInsets.only(left: 17, top: 16, bottom: 16, right: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          color: Color(0xff273443),
        ),
        child: Text(
          message.message,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// hesham@gmail.com
// 123456789