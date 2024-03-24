import 'dart:math';

import 'package:Mental_Health/Pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';
import 'package:Mental_Health/Pages/YogaPage.dart';
import 'package:Mental_Health/Pages/MeditationPage.dart';
import 'package:Mental_Health/Pages/CreationPage.dart';
import 'package:Mental_Health/Pages/TrainingPage.dart';
import 'package:Mental_Health/Pages/NewsPage.dart';
import 'package:Mental_Health/Pages/StatisticsPage.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);
Color grayButtomColor = Color(0xFF474A51);

class MainPageState extends StatefulWidget {
  MainPageState({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

void navigateToPage(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}

class oneClass extends StatelessWidget {
  final Image image;
  final Widget page;
  final String text;

  const oneClass(
      {Key? key, required this.image, required this.text, required this.page})
      : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToPage(context, page),
      // add this onTap property
      child: Container(
          width: 253.0,
          height: 253.0,
          child: Stack(
            children: [
              image,
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(text,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ],
          )),
    );
  }
}

class _MainPageState extends State<MainPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildMainPageContainer(),
      ),
    );
  }

  Widget buildMainPageContainer() {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      child: Stack(
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              classes(),
              SizedBox(height: 20),
              dailyOffer(),
              SizedBox(height: 20),
              news(),
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

  Widget classes() {
    return Column(
      children: [
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Занятия для вас",
              style: TextStyle(
                  fontSize: 23,
                  color: grayButtomColor,
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.left,
            )),
        SizedBox(height: 10),
        classesScroll(),
      ],
    );
  }

  Widget classesScroll() {
    return Container(
      height: 253,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            oneClass(
              image: Image.asset('assets/Images/Yoga.jpg',
                  width: 250, height: 250, fit: BoxFit.cover),
              text: "Йога",
              page: YogaPageState(),
            ),
            SizedBox(
              width: 25,
            ),
            oneClass(
              image: Image.asset('assets/Images/Meditation.jpg',
                  width: 250, height: 250, fit: BoxFit.cover),
              text: "Медитации",
              page: MeditationPageState(),
            ),
            SizedBox(
              width: 25,
            ),
            oneClass(
              image: Image.asset('assets/Images/Training.jpg',
                  width: 250, height: 250, fit: BoxFit.cover),
              text: "Тренировки",
              page: TrainingPageState(),
            ),
            SizedBox(
              width: 25,
            ),
            oneClass(
              image: Image.asset('assets/Images/Creation.jpg',
                  width: 250, height: 250, fit: BoxFit.cover),
              text: "Творчество",
              page: CreationPageState(),
            ),
            SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget dailyOffer() {
    int numYoga = notices
        .where(
            (notion) => notion.getActivityTextsList().contains("Занятие йогой"))
        .length;
    int numMeditation = notices
        .where((notion) => notion.getActivityTextsList().contains("Медитация"))
        .length;
    int numTraining = notices
        .where((notion) =>
            notion.getActivityTextsList().contains("Занятие спортом"))
        .length;
    int numCreation = notices
        .where((notion) => notion.getActivityTextsList().contains("Творчество"))
        .length;
    int minimum =
        min(min(min(numYoga, numMeditation), numTraining), numCreation);

    Widget activityWidget = _DayOffer(
      image: Image.asset(
        'assets/Images/DayOffer2.jpg',
        width: 380,
        height: 210,
        fit: BoxFit.cover,
      ),
      text: "Начни день с йоги",
      page: YogaPageState(),
    );
    if (minimum == numYoga) {
      activityWidget = _DayOffer(
        image: Image.asset(
          'assets/Images/DayOffer2.jpg',
          width: 380,
          height: 210,
          fit: BoxFit.cover,
        ),
        text: "Начни день с йоги",
        page: YogaPageState(),
      );
    } else if (minimum == numMeditation) {
      activityWidget = _DayOffer(
        image: Image.asset(
          'assets/Images/DayOffer2.jpg',
          width: 380,
          height: 210,
          fit: BoxFit.cover,
        ),
        text: "Начни день с медитации",
        page: MeditationPageState(),
      );
    } else if (minimum == numTraining) {
      activityWidget = _DayOffer(
        image: Image.asset(
          'assets/Images/DayOffer2.jpg',
          width: 380,
          height: 210,
          fit: BoxFit.cover,
        ),
        text: "Начни день с тренировки",
        page: TrainingPageState(),
      );
    } else if (minimum == numCreation) {
      activityWidget = _DayOffer(
        image: Image.asset(
          'assets/Images/DayOffer2.jpg',
          width: 380,
          height: 210,
          fit: BoxFit.cover,
        ),
        text: "Начни день с творчества",
        page: CreationPageState(),
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              child: Text("Предложение дня",
                  style: TextStyle(
                      fontSize: 23,
                      color: grayButtomColor,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.left)),
          SizedBox(height: 10),
          SizedBox(
            child: activityWidget,
          ),
        ],
      ),
    );
  }

  Widget news() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              child: Text("Интересное",
                  style: TextStyle(
                      fontSize: 23,
                      color: grayButtomColor,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.left)),
          SizedBox(height: 10),
          oneNews(
            image: Image.asset('assets/Images/News1.jpg',
                width: 380, height: 210, fit: BoxFit.cover),
            text: newsTitle[0],
            page: NewsPageState(index: 0),
          ),
          SizedBox(height: 20),
          oneNews(
            image: Image.asset('assets/Images/News3.jpg',
                width: 380, height: 210, fit: BoxFit.cover),
            text: newsTitle[1],
            page: NewsPageState(index: 1),
          ),
          SizedBox(height: 20),
          oneNews(
            image: Image.asset('assets/Images/News4.jpg',
                width: 380, height: 210, fit: BoxFit.cover),
            text: newsTitle[2],
            page: NewsPageState(index: 2),
          ),
          SizedBox(height: 20),
          oneNews(
            image: Image.asset('assets/Images/News5.jpg',
                width: 380, height: 210, fit: BoxFit.cover),
            text: newsTitle[3],
            page: NewsPageState(index: 3),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _DayOffer extends StatelessWidget {
  final Image image;
  final String text;
  final Widget page;

  const _DayOffer({
    super.key,
    required this.page,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToPage(context, page),
      child: Container(
        width: 380,
        height: 210,
        child: Stack(
          children: [
            image,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(text,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class oneNews extends StatelessWidget {
  final Image image;
  final String text;
  final Widget page;

  const oneNews({
    super.key,
    required this.image,
    required this.text,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToPage(context, page),
      child: Center(
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
                child: Text(text,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Читать далее",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
