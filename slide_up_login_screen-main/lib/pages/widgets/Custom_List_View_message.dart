import 'package:flutter/material.dart';
import 'package:slide_up_login/models/Messages.dart';
import 'package:slide_up_login/widgets/ChatBuble.dart';

class CustomListViewmessage extends StatelessWidget {
  const CustomListViewmessage({
    super.key,
    required ScrollController scrollController,
    required this.messageList,
    required this.email,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<Message> messageList;
  final Object? email;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      controller: _scrollController,
      itemCount: messageList.length,
      itemBuilder: (context, index) {
        return messageList[index].id == email
            ? ChatBuble(
                message: messageList[index],
              )
            : ChatBubleforfrind(message: messageList[index]);
      },
    );
  }
}