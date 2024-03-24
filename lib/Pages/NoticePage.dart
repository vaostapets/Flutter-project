import 'dart:io';

import 'package:Mental_Health/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:Mental_Health/Pages/Panel.dart';
import 'package:Mental_Health/Pages/ProfilePage.dart';

import '../Models/TimeConverter.dart';
import '../Services/HttpPost.dart';
import '../Statistics/Notion.dart';
import 'MoodPage.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color greyButtonColor = Color(0xFFD9D9D9);
int indexText = 0;
int indexIcon = 0;
List<Image> icons = [
  Image.asset('assets/Icons/NotionIcons/DoingSport.png'),
  Image.asset('assets/Icons/NotionIcons/Walk.png'),
  Image.asset('assets/Icons/NotionIcons/HealthySleep.png'),
  Image.asset('assets/Icons/NotionIcons/HealthyNutrition.png'),
  Image.asset('assets/Icons/NotionIcons/Meditation.png'),
  Image.asset('assets/Icons/NotionIcons/Gratitude.png'),
  Image.asset('assets/Icons/NotionIcons/GoodDeed.png'),
  Image.asset('assets/Icons/NotionIcons/YogaClass.png'),
  Image.asset('assets/Icons/NotionIcons/Communication.png'),
  Image.asset('assets/Icons/NotionIcons/TimeWithFamily.png'),
  Image.asset('assets/Icons/NotionIcons/HeartConversation.png'),
  Image.asset('assets/Icons/NotionIcons/SolvingProblem.png'),
  Image.asset('assets/Icons/NotionIcons/LearningNew.png'),
  Image.asset('assets/Icons/NotionIcons/NetworksLimit.png'),
  Image.asset('assets/Icons/NotionIcons/PleasantAtmosphere.png'),
  Image.asset('assets/Icons/NotionIcons/TimeToRest.png'),
  Image.asset('assets/Icons/NotionIcons/Hobby.png'),
  Image.asset('assets/Icons/NotionIcons/Creation.png'),
  Image.asset('assets/Icons/NotionIcons/CulturalEvent.png'),
  Image.asset('assets/Icons/NotionIcons/TryNewOne.png'),
  Image.asset('assets/Icons/NotionIcons/Care.png'),
  Image.asset('assets/Icons/NotionIcons/TimeWithYourself.png'),
  Image.asset('assets/Icons/NotionIcons/UsefulHabits.png'),
  Image.asset('assets/Icons/NotionIcons/KeepingDiary.png'),
];
List<String> texts = [
  "Занятие спортом",
  "Прогулка",
  "Здоровый сон",
  "Полезное питание",
  "Медитация",
  "Благодарность",
  "Доброе дело",
  "Занятие йогой",
  "Общение с людьми",
  "Время с семьей",
  "Разговор по душам",
  "Решение проблемы",
  "Изучение нового",
  "Лимит соц сетей",
  "Приятная атмосфера",
  "Время на отдых",
  "Хобби",
  "Творчество",
  "Культурное событие",
  "Попробовать новое",
  "Уход",
  "Время с собой",
  "Полезные привычки",
  "Ведение дневника",
];

List<Image> selectedIcons = [];
List<String> selectedTexts = [];
Image selectedPhoto = Image.asset(('assets/Icons/Arrow'));
String selectedNotion= "";


class NoticePageState extends StatefulWidget {
  NoticePageState({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePageState> {
  @override
  Widget build(BuildContext context) {
    selectedIcons = [];
    selectedTexts = [];
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildNoticePageContainer(),
      ),
    );
  }

  Widget buildNoticePageContainer() {
    List<String> titles = [
      "Здоровье",
      "Духовность",
      "Социальная жизнь",
      "Производительность",
      "Яркость жизни",
      "Забота о себе"
    ];

    return Container(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              width: 390,
              color: backgroundColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Чем вы занимались?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _BlockWidget(
                      title: titles[0],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _BlockWidget(
                      title: titles[1],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _BlockWidget(
                      title: titles[2],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _BlockWidget(
                      title: titles[3],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _BlockWidget(
                      title: titles[4],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _BlockWidget(
                      title: titles[5],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _TextNotion(),
                    SizedBox(
                      height: 20,
                    ),
                    _PhotoWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _SaveButton(),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 92,
            child: BottomPanel(),
          ),
        ],
      ),
    );
  }
}

class _PhotoWidget extends StatefulWidget {
  const _PhotoWidget({Key? key}) : super(key: key);

  @override
  _PhotoWidgetState createState() => _PhotoWidgetState();
}
class _PhotoWidgetState extends State<_PhotoWidget> {
  File? _imageFile = null;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile != null ? File(pickedFile.path) : null;
      selectedPhoto = _imageFile as Image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 390,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _pickImage,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: _imageFile == null ? Colors.grey[450] : null,
                  image: _imageFile != null
                      ? DecorationImage(
                          image: FileImage(_imageFile!), fit: BoxFit.cover)
                      : null,
                ),
                child: _imageFile == null
                    ? Column(children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Text('Фото',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))),
                      ])
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextNotion extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
   _TextNotion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: 10,
      minLines: 1,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.done,
      cursorColor: Colors.white,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Заметка',
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Нажмите, чтобы добавить заметку',
        helperStyle: TextStyle(color: Colors.white),
        contentPadding: EdgeInsets.all(30),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onTap: () {
        selectedNotion = _controller.text;
      },
      onEditingComplete:  () {
        selectedNotion = _controller.text;
      },
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          overlayColor: MaterialStateProperty.all(Colors.white12),
          elevation: MaterialStateProperty.all(5),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 25, vertical: 15)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(color: Colors.white),
          )),
        ),
        onPressed: () {
          sendDataToServer(
              selectedEmoji,
              formatter.format(selectedDate!),
              selectedNotion,
              selectedTexts);
          Notion note = new Notion(
              emoji: selectedEmoji,
              date: formatter.format(selectedDate!),
              noteText: selectedNotion,
              activityTextsList: selectedTexts,
              activityIconList: selectedIcons);

          notices.add(note);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePageState()),
          );
        },
        child: Text(
          "Сохранить",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ));
  }
}

class _BlockWidget extends StatelessWidget {
  final String title;

  const _BlockWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 390,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))),
          SizedBox(
            height: 17,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _IconAndTextWidget(
                  icon: icons[(indexIcon++)%24], text: texts[(indexText++)%24]),
              _IconAndTextWidget(
                  icon: icons[(indexIcon++)%24], text: texts[(indexText++)%24]),
              _IconAndTextWidget(
                  icon: icons[(indexIcon++)%24], text: texts[(indexText++)%24]),
              _IconAndTextWidget(
                  icon: icons[(indexIcon++)%24], text: texts[(indexText++)%24]),
            ],
          )
        ],
      ),
    );
  }
}
class _IconAndTextWidget extends StatefulWidget {
  final Image icon;
  final String text;

  const _IconAndTextWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  _IconAndTextWidgetState createState() => _IconAndTextWidgetState();
}

class _IconAndTextWidgetState extends State<_IconAndTextWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 90,
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              child: Stack(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (selectedIcons.contains(widget.icon)) {
                        selectedIcons.remove(widget.icon);
                      } else {
                        selectedIcons.add(widget.icon);
                      }
                      if (selectedTexts.contains(widget.text)) {
                        selectedTexts.remove(widget.text);
                      } else {
                        selectedTexts.add(widget.text);
                      }
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: Text(""),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      minimumSize: Size(80, 80),
                      primary: isSelected ? Colors.blueGrey : greyButtonColor,
                    ),
                  ),
                  Align(alignment: Alignment.center, child: widget.icon),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.text + '\n',
              maxLines: 2,
              style: TextStyle(color: Colors.white, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
