import 'package:flutter/material.dart';

Color backgroundColorClear = Color.fromRGBO(182, 182, 182, 0);
Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

String sortedMedDirection = "любое направление";
class DirectionMedScreenPageState extends StatefulWidget {
  DirectionMedScreenPageState({Key? key}) : super(key: key);

  @override
  _DirectionMedScreenPageState createState() => _DirectionMedScreenPageState();
}

class _DirectionMedScreenPageState extends State<DirectionMedScreenPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorClear,
      body: Center(
        child: buildDirectionMedScreenPageContainer(),
      ),
    );
  }

  Widget buildDirectionMedScreenPageContainer() {
    List<String> times = ["Утренняя медитация", "Вечерняя медитация", "Расслабление", "Аффирмации", "Медитации для продвинутых", "любое направление"];
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 290,
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
          sortedMedDirection = text;
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
