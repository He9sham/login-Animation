import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_up_login/models/Messages.dart';
import 'package:slide_up_login/pages/Cubit/Chat_cubit/chat_cubit.dart';
import 'package:slide_up_login/pages/widgets/Custom_List_View_message.dart';
import 'package:slide_up_login/pages/widgets/custom_appbar.dart';
import 'package:slide_up_login/pages/widgets/custom_icon.dart';

class ChatPage extends StatefulWidget {
  static String id = 'ChatApp';

  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController controller = TextEditingController();

  final _scrollController = ScrollController();

  List<Message> messageList = [];

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 15, 9, 9),
      appBar: AppBar(
        actions: const [
          CustomIcon()
        ],
        title: const CustomAppBar(),
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
                return CustomListViewmessage(
                  scrollController: _scrollController,
                  messageList: messageList,
                  email: email,
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
                SendMessageContent(data, context, email);
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

  // ignore: non_constant_identifier_names
  void SendMessageContent(String data, BuildContext context, Object? email) {
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
  }
}
