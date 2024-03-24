import 'package:flutter/material.dart';

Color backgroundColorClear = Color.fromRGBO(182, 182, 182, 0);
Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

String sortedDirection = "любое направление";
class DirectionScreenPageState extends StatefulWidget {
  DirectionScreenPageState({Key? key}) : super(key: key);

  @override
  _DirectionScreenPageState createState() => _DirectionScreenPageState();
}

class _DirectionScreenPageState extends State<DirectionScreenPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorClear,
      body: Center(
        child: buildDirectionScreenPageContainer(),
      ),
    );
  }

  Widget buildDirectionScreenPageContainer() {
    List<String> times = ["Хатха йога", "Оздоровительная йога", "Йога нидра", "Фитнес йога", "Стретчинг йога", "Шивананда йога", "любое направление"];
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 350,
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
          sortedDirection = text;
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
