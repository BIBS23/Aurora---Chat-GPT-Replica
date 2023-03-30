import 'package:chat_gpt/Provider/my_response.dart';
import 'package:chat_gpt/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => MyResponse())
    ] ,child: MaterialApp(
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: GradientText(
            "AURORA",
            style: const TextStyle(
              fontSize: 20,
              letterSpacing: 20,
            ),
            colors: const [
              Colors.blue,
              Colors.red,
            ],
          ),
          centerTitle: true,
        ),
        body:  ChatBot()
      ),
    ));
  }
}
