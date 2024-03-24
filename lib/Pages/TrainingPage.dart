import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:Mental_Health/Services/HttpGet.dart';
import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';
import 'package:Mental_Health/Pages/TimeScreenPage.dart';
import 'package:Mental_Health/Pages/LevelScreenPage.dart';
import 'package:Mental_Health/Pages/DirectionScreenPage.dart';
import 'package:Mental_Health/Pages/VideoPage.dart';

import '../Youtube/Video.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class TrainingPageState extends StatefulWidget {
  TrainingPageState({Key? key}) : super(key: key);

  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildTrainingPageContainer(),
      ),
    );
  }

  Widget buildTrainingPageContainer() {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      child: Stack(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              topPanel(),
              training(),
            ],
          ),
          if (_showOverlayTime)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: _hideTimeScreenPage,
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
          if (_showOverlayTime)
            Positioned(
              top: 135,
              left: 0,
              right: 0,
              bottom: 460,
              child: TimeScreenPageState(),
            ),
          if (_showOverlayLevel)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: _hideLevelScreenPage,
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
          if (_showOverlayLevel)
            Positioned(
              top: 135,
              left: 0,
              right: 0,
              bottom: 510,
              child: LevelScreenPageState(),
            ),
          if (_showOverlayDirection)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: _hideDirectionScreenPage,
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
          if (_showOverlayDirection)
            Positioned(
              top: 135,
              left: 0,
              right: 0,
              bottom: 340,
              child: DirectionScreenPageState(),
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

  bool _showOverlayTime = false;
  bool _showOverlayLevel = false;
  bool _showOverlayDirection = false;

  Widget customButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: () {
        if (text == "Время") {
          _showTimeScreenPage();
        } else {
          if (text == "Уровень") {
            _showLevelScreenPage();
          } else {
            if (text == "Направление") {
              _showDirectionScreenPage();
            }
          }
        }
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: whiteTextColor, width: 1.0),
        ),
        minimumSize: MaterialStateProperty.all(Size(0, 56)),
      ),
      child: Text(text, style: TextStyle(fontSize: 16, color: whiteTextColor)),
    );
  }

  Widget topPanel() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: _showTimeScreenPage,
            child: customButton("Время", () {}),
          ),
          GestureDetector(
            onTap: _showLevelScreenPage,
            child: customButton("Уровень", () {}),
          ),
          GestureDetector(
            onTap: _showLevelScreenPage,
            child: customButton("Направление", () {}),
          ),
        ],
      ),
    );
  }

  void _showTimeScreenPage() {
    setState(() {
      _showOverlayTime = true;
    });
  }

  void _hideTimeScreenPage() {
    setState(() {
      _showOverlayTime = false;
    });
  }

  void _showLevelScreenPage() {
    setState(() {
      _showOverlayLevel = true;
    });
  }

  void _hideLevelScreenPage() {
    setState(() {
      _showOverlayLevel = false;
    });
  }

  void _showDirectionScreenPage() {
    setState(() {
      _showOverlayDirection = true;
    });
  }

  void _hideDirectionScreenPage() {
    setState(() {
      _showOverlayDirection = false;
    });
  }

  Widget training() {
    List<Video> videosList = getVideoList();

    return Container(
      child: videosList.isEmpty
          ? Container()
          : Container(
        height: 640,
        child: ListView.builder(
          itemCount: videosList.length,
          itemBuilder: (BuildContext context, int index) {
            return oneVideos(
              image: videosList[index].getImage(),
              url: videosList[index].getUrl(),
              workout_type: videosList[index].getWorkoutType(),
              difficulty: videosList[index].getDifficulty(),
              duration: videosList[index].getDuration().toString(),
              description: videosList[index].getDescription(),
            );
          },
        ),
      ),
    );
  }

  List<Video> getVideoList() {
    final file =
    File('/Users/aliya/StudioProjects/mental_health_new/training.json');
    final jsonString = file.readAsStringSync();
    final data = jsonDecode(jsonString).cast<Map<String, dynamic>>();
    List<Video> videosList = videoListFromJson(data);
    if(sortedTime == "5-10 мин"){
      videosList.removeWhere((video) {
        return video.duration < 5 || video.duration > 10;
      });
    }
    if(sortedTime == "10-20 мин"){
      videosList.removeWhere((video) {
        return video.duration < 10 || video.duration > 20;
      });
    }
    if(sortedTime == "20-40 мин"){
      videosList.removeWhere((video) {
        return video.duration < 20 || video.duration > 40;
      });
    }
    if(sortedTime == "40+ мин"){
      videosList.removeWhere((video) {
        return video.duration < 40;
      });
    }

    if(sortedLevel == "Начальный"){
      videosList.removeWhere((video) {
        return video.difficulty != "beginner";
      });
    }

    if(sortedLevel == "Средний"){
      videosList.removeWhere((video) {
        return video.difficulty != "medium";
      });
    }

    if(sortedLevel == "Продвинутый"){
      videosList.removeWhere((video) {
        return video.difficulty != "advanced";
      });
    }

    if(sortedDirection != "любое направление"){
      videosList.removeWhere((video) {
        return video.workout_type != sortedDirection;
      });
    }

    return videosList;
  }
}

class oneVideos extends StatelessWidget {
  final Image image;
  final String url;
  final String workout_type;
  final String difficulty;
  final String duration;
  final String description;

  const oneVideos({
    super.key,
    required this.image,
    required this.url,
    required this.workout_type,
    required this.difficulty,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VideoPageState(
                    videoUrl: url,
                    workoutType: workout_type,
                    duration: duration + ' минут',
                    difficulty: translate(difficulty),
                    description: description,
                  )),
            );
          },
          child: Container(
            width: 380,
            height: 210,
            child: Stack(
              children: [
                Container(
                  child: image,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(workout_type,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(translate(difficulty) + ' ',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                        Text(duration + ' минут',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/Icons/Video.png'),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  translate(String difficulty) {
    if (difficulty == "beginner") {
      return 'Новичок';
    }
    if (difficulty == "medium") {
      return 'Средний';
    }
    if (difficulty == "advanced") {
      return 'Продвинутый';
    }
  }
}
