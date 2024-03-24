import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Statistics/CustomPaintWidget.dart';
import 'Panel.dart';
import 'ProfilePage.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class StatisticsPageState extends StatefulWidget {
  StatisticsPageState({Key? key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPageState> {
  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState(){
    super.initState();
    _getStatisticsFromServer();
    // Здесь мы парсим JSON строку и получаем List<Map<String, dynamic>>
  }
  void _getStatisticsFromServer() async {
    var url = Uri.parse('http://localhost:8080/statistics');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _dataList = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: buildStatisticsPageContainer(),
            ),
          ),
          Positioned(
            top: 35,
            left: 10,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Image.asset('assets/Icons/ArrowRight.png'))
          ),
        ],
      ),
    );
  }

  Widget buildStatisticsPageContainer() {

    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'Статистика',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: whiteTextColor,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Общее количество заметок: ${_getTotalCount()}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: whiteTextColor,
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        buildStatisticsRow(_dataList[index]),
                        SizedBox(height: 16.0),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          width: 390,
          height: 92,
          child: BottomPanel(),
        )
      ],
    );
  }


  Widget buildStatisticsRow(Map<String, dynamic> data) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.black38,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data['name'] + ' ',
                style: TextStyle(
                  fontSize: 24.0,
                  color: whiteTextColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5),
              Text(
                'Вы занимались ${data['count']} раз',
                style: TextStyle(
                  fontSize: 16.0,
                  color: whiteTextColor,
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPaintWidget(
                percentage: data['percentage'] / 100,
              ),
            ],
          ),
        ],
      ),
    );
  }

  int _getTotalCount() {
    return notices.length;
  }
}
