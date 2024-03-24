import 'package:Mental_Health/Pages/MoodPage.dart';
import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';

Color whiteTextColor = Color(0xFFFFFFFF);
Color grayButtomColor = Color(0xFFD9D9D9);

class PlusPageState extends StatefulWidget {
  PlusPageState({Key? key}) : super(key: key);

  @override
  _PlusPageState createState() => _PlusPageState();
}

class _PlusPageState extends State<PlusPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.6),
      body: Center(
        child: buildPlusPageContainer(),
      ),
    );
  }

  Widget buildPlusPageContainer() {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          width: 390,
          height: 92,
          child: BottomPanel(),
        ),
        _ButtomWidget(right: 200, left: 0, bottom: 140, text: 'Вчера', icon: Image.asset('assets/Icons/Arrow.png'),),
        _ButtomWidget(right: 0, left: 200, bottom: 140, text: 'Другой день', icon: Image.asset('assets/Icons/Calendar2.png'),),
        _ButtomWidget(right: 0, left: 0, bottom: 220, text: 'Сегодня', icon: Image.asset('assets/Icons/Calendar.png'),),

      ],
    );
  }
}

class _ButtomWidget extends StatelessWidget {
  final double right;
  final double left;
  final double bottom;
  final String text;
  final Image icon;
  const _ButtomWidget({Key? key, required this.right, required this.left, required this.bottom, required this.text, required this.icon}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      left: left,
      bottom: bottom,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MoodPageState()),
              );
            },
            child: icon,
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              minimumSize: Size(80, 80),
              primary: grayButtomColor,
            ),
          ),
          SizedBox(height: 5,),
          Text(text, style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 20)),
        ],
      ),
    );
  }
}
