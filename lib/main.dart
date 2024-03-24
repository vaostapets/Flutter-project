import 'package:Mental_Health/Statistics/CustomPaintWidget.dart';
import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/MainPage.dart';
import 'package:Mental_Health/Pages/SettingsPage.dart';
import 'package:Mental_Health/Pages/Panel.dart';
import 'package:Mental_Health/Pages/YogaPage.dart';
import 'package:Mental_Health/Pages/ProfilePage.dart';
import 'package:Mental_Health/Pages/NewsPage.dart';
import 'package:Mental_Health/Pages/PlusPage.dart';
import 'package:Mental_Health/Pages/MoodPage.dart';
import 'package:Mental_Health/Pages/VideoPage.dart';
import 'package:Mental_Health/Services/HttpGet.dart';

import 'package:Mental_Health/Pages/NoticePage.dart';

import 'package:Mental_Health/Youtube/YoutubePlayer.dart';

void main() async {
  runApp(MyApp());
}

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        backgroundColor: Colors.blueAccent,
      ),
      home:  MainPageState(),
    );
  }
}