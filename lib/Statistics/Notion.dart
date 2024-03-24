import 'dart:io';

import 'package:flutter/material.dart';

class Notion {

  String emoji;
  String date;
  String noteText;
  List<String> activityTextsList;
  List<Image> activityIconList;

  Notion(
      {required this.emoji,
        required this.date,
        required this.noteText,
        required this.activityTextsList,
        required this.activityIconList,
        });

  factory Notion.fromJson(Map<String, dynamic> json, int index) {
      return Notion(
        emoji: json['image'],
        date: json['date'],
        noteText: json['noteText'],
        activityTextsList: json['activityTexts'],
        activityIconList: [Image.asset('assets/Icons/SmileGreat.png'),],
        );


  }
  List<Image> getActivityIconList(){
    return activityIconList;
  }
  String getEmoji(){
    return emoji;
  }
  String getDate(){
    return date;
  }
  String getText(){
    return noteText;
  }
  List<String> getActivityTextsList(){
    return activityTextsList;
  }

}
