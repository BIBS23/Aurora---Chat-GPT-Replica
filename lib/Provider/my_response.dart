import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyResponse with ChangeNotifier {
  String? get result => _result;
  List<String> get myResponses => myResp;
  List<String> myResp = [];
  String? _result;

  Future<void> getResponse(String question) async {
    final url = Uri.parse('https://chatgpt53.p.rapidapi.com/');

    final response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
        'X-RapidAPI-Key': 'd901229ba7msh8d802a638e59c1bp16fdd2jsn8b8778342d62',
        'X-RapidAPI-Host': 'chatgpt53.p.rapidapi.com',
      },
      body: jsonEncode({
        'messages': [
          {
            'role': 'user',
            'content': question,
          },
        ],
        'temperature': 1,
        'max_tokens': 250,
      }),
    );

    final data = jsonDecode(response.body);
    final choices = data['choices'];

    if (choices != null && choices.isNotEmpty) {
      _result = choices[0]['message']['content'].toString();
      myResp.add(_result!);
    }

  
    print('Request Body: ${jsonEncode({
      'messages': [
        {
          'role': 'user',
          'content': question,
        },
      ],
      'temperature': 1,
    })}');

    notifyListeners();
  }
}
