import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';
import 'package:flutter/rendering.dart';
import 'package:Mental_Health/Pages/NoticePage.dart';


Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);
Color grayButtomColor = Color(0xFFD9D9D9);

DateTime? selectedDate = DateTime.now();
String selectedEmoji = "отлично";

class MoodPageState extends StatefulWidget {
  MoodPageState({Key? key}) : super(key: key);

  @override
  _MoodPageState createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPageState> {
  DateTime? selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    selectedDate = DateTime.now();
  }

  void handleDateSelected(DateTime? date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildMoodPageContainer(),
      ),
    );
  }

  Widget buildMoodPageContainer() {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 190),
              _TextWidget(),
              SizedBox(height: 50),
              _DataSelectionWidget(selectedDate, handleDateSelected),
              SizedBox(height: 130),
              Row(
                children: [
                  _SmileAndTextWidget(icon: Image.asset('assets/Icons/SmileGreat.png'), text: 'супер',),
                  _SmileAndTextWidget(icon: Image.asset('assets/Icons/SmileGood.png'), text: 'хорошо',),
                  _SmileAndTextWidget(icon: Image.asset('assets/Icons/SmileSoSo.png'), text: 'так себе',),
                  _SmileAndTextWidget(icon: Image.asset('assets/Icons/SmileBad.png'), text: 'плохо',),
                  _SmileAndTextWidget(icon: Image.asset('assets/Icons/SmileAwful.png'), text: 'ужасно',),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            width: 390,
            height: 92,
            child: BottomPanel(),
          ),
        ],
      ),
    );
  }
}

class _DataSelectionWidget extends StatelessWidget {
  final DateTime? initialDate;
  final void Function(DateTime?) onDateSelected;

  _DataSelectionWidget(this.initialDate, this.onDateSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.zero,
            ),
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: initialDate ?? DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );

              if (picked != null && picked != initialDate) {
                onDateSelected(picked);
                selectedDate = initialDate;
              } else{
                selectedDate = DateTime.now();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 5),
                  Text(
                    "Сегодня, ${initialDate?.day}.${initialDate?.month.toString().padLeft(2, '0') }",
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmileAndTextWidget extends StatelessWidget {
  final Image icon;
  final String text;
  const _SmileAndTextWidget({
    super.key, required this.icon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
      Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0),
              primary: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoticePageState()),
              );
              selectedEmoji = text;
            },
            child: icon,
          ),
          SizedBox(height: 5,),
          Text(text, style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 15)),
        ],
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        'Как вы себя чувствуете?',
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 27, fontWeight: FontWeight.w600),
      ),
    );
  }
}
