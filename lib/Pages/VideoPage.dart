import 'package:Mental_Health/Pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';
import 'package:Mental_Health/Pages/YogaPage.dart';
import 'package:Mental_Health/Youtube/YoutubePlayer.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

late String _workoutType;
late String _difficulty;
late String _duration;
late String _description;

class VideoPageState extends StatefulWidget {
  final String videoUrl;
  final String workoutType;
  final String difficulty;
  final String duration;
  final String description;

  VideoPageState({
    Key? key,
    required this.videoUrl,
    required this.workoutType,
    required this.difficulty,
    required this.duration,
    required this.description,
  }) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPageState> {
  @override
  void initState() {
    super.initState();
    _description = widget.description;
    _difficulty = widget.difficulty;
    _duration = widget.duration;
    _workoutType = widget.workoutType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildVideoPageContainer(),
      ),
    );
  }

  Widget buildVideoPageContainer() {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/Icons/ArrowRight.png')),
                ),
              ),
              Container(
                height: 198,
                width: 350,
                child: VideoPlayerWidget(
                  videoUrl: widget.videoUrl,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _NewsNumberWidget(),
              SizedBox(
                height: 10,
              ),
              _VideoTextWidget()
            ],
          ),
          Positioned(
            bottom: 0,
            width: 390,
            height: 92,
            child: BottomPanel(),
          )
        ],
      ),
    );
  }
}

class _VideoTextWidget extends StatelessWidget {
  const _VideoTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        _description,
        style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 20),
      ),
    );
  }
}

class _NewsNumberWidget extends StatelessWidget {
  const _NewsNumberWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              _workoutType,
              style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 35),
            ),
          ),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                _difficulty,
                style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                _duration,
                style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

