import 'package:chat_gpt/Provider/my_response.dart';
import 'package:chat_gpt/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';
import 'package:provider/provider.dart';

class ChatBot extends StatefulWidget {
  static List myrespo = [];

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  TextEditingController myqn = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<MyResponse>(builder: (context, myRespo, child) {
      final h = myRespo.myResp;
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: myRespo.myResp.length,
              itemBuilder: (context, index) {
                return ChatMessage(text: h[index]);
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ))),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: myqn,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              splashRadius: 0.3,
                              onPressed: () {
                             
                                setState(() {
                                  FocusScope.of(context).unfocus();
                                  _scrollController.animateTo(
                                      _scrollController
                                          .position.maxScrollExtent,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeInOut);
                                });
                                myRespo.getResponse(myqn.text);
                                myqn.clear();
                              },
                              icon: const Icon(Icons.send)),
                          hintText: "Type your anything...",
                          border: const GradientOutlineInputBorder(
                              gradient: LinearGradient(colors: [
                            Colors.blue,
                            Colors.red,
                          ]))),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }));
  }
}
