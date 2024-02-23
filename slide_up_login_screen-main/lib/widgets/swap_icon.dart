import 'package:flutter/material.dart';

/// Flutter code sample for [AnimatedAlign].

void main() => runApp(const AnimatedAlignExampleApp());

class AnimatedAlignExampleApp extends StatefulWidget {
  const AnimatedAlignExampleApp({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignExampleApp> createState() =>
      _AnimatedAlignExampleAppState();
}

class _AnimatedAlignExampleAppState extends State<AnimatedAlignExampleApp> {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_2),
              onPressed: toggleTheme,
            ),
          ],
        ),
      ),
    );
  }
}