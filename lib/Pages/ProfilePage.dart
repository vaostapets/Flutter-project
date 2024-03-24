import 'package:Mental_Health/Pages/MoodPage.dart';
import 'package:Mental_Health/Pages/NoticePage.dart';
import 'package:Mental_Health/Pages/SettingsPage.dart';
import 'package:Mental_Health/Services/HttpPost.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Mental_Health/Pages/Panel.dart';
import 'package:Mental_Health/Pages/StatisticsPage.dart';
import 'package:image_compare/image_compare.dart';

import '../Models/TimeConverter.dart';
import '../Statistics/Notion.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);
Color buttonColor = Color(0xFFB6B6B6);
Color profileColor = Color.fromRGBO(0, 0, 0, 0.4);
String _name = "";

class ProfilePageState extends StatefulWidget {
  ProfilePageState({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

List<Notion> notices = [];

Image emojiToString(String selectedEmoji) {
  if (selectedEmoji == 'супер') {
    return Image.asset('assets/Icons/SmileGreat.png');
  }
  if (selectedEmoji == 'хорошо') {
    return Image.asset('assets/Icons/SmileGood.png');
  }
  if (selectedEmoji == 'так себе') {
    return Image.asset('assets/Icons/SmileSoSo.png');
  }
  if (selectedEmoji == 'плохо') {
    return Image.asset('assets/Icons/SmileBad.png');
  }
  if (selectedEmoji == 'ужасно') {
    return Image.asset('assets/Icons/SmileAwful.png');
  }
  return Image.asset('assets/Icons/SmileAwful.png');
}

Widget rectangle(int ind) {
  return Column(
    children: [
      Row(
        children: [
          Container(width: 40, height: 40, child: emojiToString(notices[ind].getEmoji())),
          SizedBox(
            width: 10,
          ),
          Text(notices[ind].getDate(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Expanded(
        child: SingleChildScrollView(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: notices[ind].getActivityTextsList().length,
            itemBuilder: (BuildContext context, int index) {
              return notionActions(
                image: notices[ind].getActivityIconList()[index],
                text: notices[ind].getActivityTextsList()[index],
              );
            },
          ),
        ),
      ),
      Row(
        textDirection: TextDirection.rtl,
        children: [
          Text("Читать далее",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ))
        ],
      ),
    ],
  );
}

class notionActions extends StatelessWidget {
  final Image image;
  final String text;

  const notionActions({
    required this.image,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(width: 40, height: 40, child: image),
            SizedBox(
              width: 10,
            ),
            Text(text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class _ProfilePageState extends State<ProfilePageState> {
  final _nameController = TextEditingController();

  List<Widget> _rectangles = [
    notionActions(image: Image.asset('assets/Icons/Arrow'), text: "Text"),
  ];

  File? _image = null;

  Widget avatarImage() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Choose an image'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text('Gallery'),
                      onTap: () {
                        Navigator.of(context).pop();
                        _getImageFromGallery();
                      },
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      child: Text('Camera'),
                      onTap: () {
                        Navigator.of(context).pop();
                        _getImageFromCamera();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey,
        child: _image != null
            ? ClipOval(
                child: Image.file(
                  _image!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              )
            : FutureBuilder(
                future: SharedPreferences.getInstance(),
                builder: (BuildContext context,
                    AsyncSnapshot<SharedPreferences> snapshot) {
                  if (snapshot.hasData) {
                    String? imagePath = snapshot.data!.getString('imagePath');
                    return imagePath != null
                        ? ClipOval(
                            child: Image.file(
                              File(imagePath),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(
                            Icons.camera,
                            size: 30,
                            color: whiteTextColor,
                          );
                  } else {
                    return Icon(
                      Icons.camera,
                      size: 30,
                      color: whiteTextColor,
                    );
                  }
                },
              ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = _name;
    _nameController.addListener(_changeName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  _changeName() {
    setState(() => _name = _nameController.text);
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        SharedPreferences.getInstance().then((prefs) {
          prefs.setString('imagePath', pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        SharedPreferences.getInstance().then((prefs) {
          prefs.setString('imagePath', pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    });
  }

  Widget textFieldName() {
    return Container(
      width: 250,
      child: TextField(
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
        controller: _nameController,
        textInputAction: TextInputAction.done,
        cursorColor: Colors.white,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: _name == "" ? "Введите имя" : _name,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: EdgeInsets.all(15),
          border: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black26,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget buildRectangles() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StatisticsPageState()),
        );
      },
      child: Container(
        height: 600,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: notices.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 220,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: rectangle(notices.length-1-index),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget statisticButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 63,
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StatisticsPageState()),
            );
          },
          icon: Image.asset('assets/Icons/statistics.png'),
          label: Text(
            'Статистика',
            style: TextStyle(
              color: whiteTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfilePageContainer() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: backgroundColor,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPageState()),
                        );
                      },
                      child: Container(
                          width: 30,
                          height: 30,
                          child: Image.asset('assets/Icons/settings.png'))),
                ],
              ),
              Column(
                children: [
                  avatarImage(),
                  SizedBox(height: 10),
                  textFieldName(),
                  SizedBox(height: 20),
                  statisticButton(context),
//Text("Записи", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                  buildRectangles(),
                ],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildProfilePageContainer(),
      ),
    );
  }
}
