import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_up_login/firebase_options.dart';
import 'package:slide_up_login/pages/Chat_page.dart';
import 'package:slide_up_login/pages/Cubit/Chat_cubit/chat_cubit.dart';
import 'package:slide_up_login/pages/Cubit/login_cubit/login_cubit.dart';
import 'package:slide_up_login/pages/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ChatCubit())
      ],
      child: MaterialApp(
        routes: {
          ChatPage.id: (context) => ChatPage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xff07193f),
          primaryColorLight: const Color(0xff2d55ee),
          bottomSheetTheme: const BottomSheetThemeData(
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.transparent),
        ),
        home: LoginScreen(),
      ),
    );
  }
}
