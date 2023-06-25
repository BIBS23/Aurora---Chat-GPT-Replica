import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ChatMessage extends StatelessWidget {
  final text;

  const ChatMessage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8)),
            child:
         Padding(
          padding: const EdgeInsets.only(top:10,bottom: 10,left: 20,right: 20),
          child:  GradientText(text,textAlign: TextAlign.justify, style: const TextStyle(fontSize: 20),colors: const [Colors.blue, Colors.red]),
        ),
      ),
    );
  }
}
