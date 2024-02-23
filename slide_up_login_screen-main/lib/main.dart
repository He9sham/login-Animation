import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:slide_up_login/firebase_options.dart';
import 'package:slide_up_login/pages/Chat_page.dart';
import 'package:slide_up_login/pages/login_screen.dart';
void main()async {
  
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
    return MaterialApp(
        routes: {
        ChatPage.id: (context) => const ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:const  Color(0xff07193f),
        primaryColorLight:const  Color(0xff2d55ee) ,

        bottomSheetTheme:const  BottomSheetThemeData(
          surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent)
      ),
      home: const LoginScreen(),
    );
  }
}