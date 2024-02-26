import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:slide_up_login/conest.dart';
import 'package:slide_up_login/models/Messages.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kmessagesCollection);

  void SendMessage({required String message, required String email}) {
    try {
  messages.add(
    {
      kmessage: message,
      kCreatedAt: DateTime.now(),
      'id': email,
    },
  );
} on Exception catch (e) {
  // TODO
}
  }

  void getmessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List<Message> messageList = [];
      for (var doc in event.docs) {
        messageList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messageList));
    });
  }
}
