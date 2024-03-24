
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void sendDataToServer(String emojiImage, String date, String noteText, List<String> activityNames) async {
  // параметры запроса
  var url = Uri.parse('http://localhost:8080/notion');
  var headers = {'Content-Type': 'application/json'};
  var body = jsonEncode({
    'image': emojiImage,
    'date': date,
    'noteText': noteText,
    'activityTexts': activityNames,
  });

  // отправка запроса
  var response = await http.put(url, headers: headers, body: body);

  // обработка ответа
  if (response.statusCode == 200) {
    print('Данные успешно отправлены');
  } else {
    print('Произошла ошибка при отправке данных: ${response.statusCode}');
  }
}
