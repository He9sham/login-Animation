import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_up_login/conest.dart';
import 'package:slide_up_login/models/Messages.dart';
import 'package:slide_up_login/pages/Cubit/Chat_cubit/chat_cubit.dart';
import 'package:slide_up_login/widgets/ChatBuble.dart';
import 'package:slide_up_login/widgets/swap_icon.dart';

// ignore: must_be_immutable

class ChatPage extends StatelessWidget {
  static String id = 'ChatApp';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController controller = TextEditingController();
  final _scrollController = ScrollController();
  List<Message> messageList = [];
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 15, 9, 9),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(27),
              child: const SizedBox(
                width: 50,
                height: 50,
                child: AnimatedAlignExampleApp(),
              ),
            ), //AnimatedAlignExample(),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            const Text(
              'Chat',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messageList = state.messages;
                }
              },
              builder: (context, state) {
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
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: controller,
              onSubmitted: (data) {
                if (data.trim().isNotEmpty) {
                  BlocProvider.of<ChatCubit>(context)
                      .SendMessage(message: data, email: email as String);
                  controller.clear();
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  );
                } else {}
              },
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    if (controller.text.trim().isNotEmpty) {
                      BlocProvider.of<ChatCubit>(context).SendMessage(
                          message: controller.text, email: email as String);
                    } else {}
                    controller.clear();
                  },
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
                hintText: 'Message',
                hintStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide.merge(
                    const BorderSide(color: Colors.white),
                    const BorderSide(color: Colors.white),
                  ),
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
