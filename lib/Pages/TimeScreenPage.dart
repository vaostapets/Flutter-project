import 'package:flutter/material.dart';

Color backgroundColorClear = Color.fromRGBO(182, 182, 182, 0);
Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

String sortedTime = "любое время";

class TimeScreenPageState extends StatefulWidget {
  TimeScreenPageState({Key? key}) : super(key: key);

  @override
  _TimeScreenPageState createState() => _TimeScreenPageState();
}

class _TimeScreenPageState extends State<TimeScreenPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorClear,
      body: Center(
        child: buildTimeScreenPageContainer(),
      ),
    );
  }

  Widget buildTimeScreenPageContainer() {
    List<String> times = ["5-10 мин", "10-20 мин", "20-40 мин", "40+ мин", "любое время"];
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: backgroundColor,
            ),
            Center(
              child: Column(
                children: [
                  for (var item in times) createButton(item),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createButton(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: backgroundColor,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          sortedTime = text;
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(342, 24),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          primary: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: whiteTextColor),
        ),
      ),
    );
  }

}
