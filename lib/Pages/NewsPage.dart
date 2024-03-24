import 'package:Mental_Health/Pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

List<String> newsTitle = [
  'Зачем нам йога',
  'Почему ментальное здоровье это важно',
  'Ментальное и физическое здоровье',
  'Откуда берется усталость',
];
List<String> news = [
  'Йога – это отличный способ отвлечься от проблем и избавиться от ненужных мыслей. Она помогает познать себя как внешне, так и изнутри. Уже на первых занятиях вы сделаете большой шаг на пути к владению своим телом и управлению дыханием. Кроме того, как и все физические упражнения, йога позволяет держать мышцы в тонусе',
  'Психическое здоровье – это состояние психического благополучия, которое позволяет людям справляться со стрессовыми ситуациями в жизни, реализовывать свой потенциал, успешно учиться и работать, а также вносить вклад в жизнь общества. Это неотъемлемый компонент здоровья и благополучия, который лежит в основе наших индивидуальных и коллективных способностей принимать решения, строить отношения и формировать мир, в котором мы живем. Психическое здоровье – это одно из основных прав человека. Кроме того, оно имеет решающее значение для личного, общественного и социально-экономического развития',
  'Психическое расстройство – это не только развитие проблем с сознанием человека, это также в некоторых случаях и развитие серьёзных физических заболеваний. Во многом физические неполадки происходят из-за нейрохимического дисбаланса. То есть токсичные гормоны, вырабатываемые эндокринной системой в условиях стресса, могут спровоцировать появление огромного количества повреждений тканей и органов в организме.',
  'ПОЧЕМУ мы доводим себя до такого состояния? Что способствует «эмоциональному выгоранию» от жизни?Физиологические факторы. Неправильное освещение, несвежий воздух, авитоминоз, постоянное нахождение в тесном помещении, большая концентрация высоких домов в окружающем пространстве, шум машин и наблюдение за загрязнением экосреды (выхлопные газы машин, вырубка растительности, построение новых торговых центров). Психологические факторы. Ваше окружение, какое оно, кто его составляет? Нытики и неудовлетворённые особи или адекватные люди с тонким эмоциональным интеллектом? Задумайтесь, нужно ли Вам ваше окружение, для чего оно Вам? Также обратите внимание на стиль управления руководителя и ценности вашего рабочего коллектива! Возможно напряжение возникает из-за противоречий заданных запросов руководителя и ваших ожиданий от работы. Важным является и то, насколько осознанно проработанным Вы себя считаете, насколько уделяете времени и вниманию работе над собой, над преодолением своих комплексов и внутриличностных конфликтов. Это важная составляющая как жизненного, так и профессионального успеха.',
];

class NewsPageState extends StatefulWidget {
  final int index;

  const NewsPageState({
    required this.index,
    super.key,
  });

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: buildNewsPageContainer(),
      ),
    );
  }

  Widget buildNewsPageContainer() {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
              ),
              _NewsPhotoWidget(
                image:
                    Image.asset('assets/Images/News1.jpg', fit: BoxFit.cover),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                child: Column(
                  children: [
                    _NewsNumberWidget(index: widget.index),
                    SizedBox(
                      height: 10,
                    ),
                    _NewsTextWidget(index: widget.index),
                    SizedBox(height: 90,),
                  ],
                ),
              ),
              ),
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

class _NewsTextWidget extends StatelessWidget {
  final int index;

  const _NewsTextWidget({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          news[index],
          style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 20),
        ),
    );
  }
}

class _NewsNumberWidget extends StatelessWidget {
  final int index;

  const _NewsNumberWidget({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        newsTitle[index],
        style: TextStyle(color: Color(0xFFF6F6F6), fontSize: 35),
      ),
    );
  }
}

class _NewsPhotoWidget extends StatelessWidget {
  final Image image;

  const _NewsPhotoWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Stack(
        children: [
          Container(
            width: 370,
            height: 370,
            child: image,
          ),
          Positioned(
            top: 10,
            left: 10,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Image.asset('assets/Icons/ArrowRight.png')),
          ),
        ],
      ),
    );
  }
}
