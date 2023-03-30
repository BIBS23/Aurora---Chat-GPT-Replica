import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyResponse with ChangeNotifier {
  String? get result => _result;
  List get myrespo => myresp;
  List myresp = [];
  String? _result;
  

  Future<void> getResponse(String question) async {
    const apiKey = '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';
    final url = Uri.parse(
        'https://api.openai.com/v1/engines/text-davinci-002/completions');

    final response = await http.post(url,
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'prompt': '$question\n',
          'max_tokens': 500,
          'temperature': 0.5,
        
        }));
    final data = jsonDecode(response.body);
    _result = data['choices'][0]['text'].toString();

    myresp.add(_result.toString());

    notifyListeners();
  }
}
