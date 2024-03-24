import 'package:flutter/material.dart';
import 'package:Mental_Health/Pages/Panel.dart';

Color backgroundColor = Color(0xFFB6B6B6);
Color whiteTextColor = Color(0xFFFFFFFF);

class SettingsPageState extends StatefulWidget {
  SettingsPageState({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 70),
              Row(
                children: [
                  SizedBox(width: 20),
                  TextButton(onPressed: () { Navigator.pop(context);},
                      child: Image.asset('assets/Icons/ArrowRight.png')),
                ],
              ),
              SizedBox(height: 10),
              Notifications(),
              SizedBox(height: 20),
              _Friends(),
              SizedBox(height: 20),
              _UsingConditions(),
              SizedBox(height: 20),
              _PrivacyPolicy(),
              SizedBox(height: 20),
              _Support(),
              _LotusVersion(),
            ],
          ),
          Positioned(
            bottom: 0,
            width: 430,
            height: 92,
            child: BottomPanel(),
          )
        ],
      ),
    );
  }
}

class Notifications extends StatefulWidget {
  Notifications({Key? key}) : super(key: key);

  @override
  _Notifications createState() => _Notifications();
}

class _Notifications extends State<Notifications> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 58,
        width: 334,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: whiteTextColor),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.all(4),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15),
              Image.asset('assets/Icons/notifications.png'),
              SizedBox(width: 25),
              Text('Включить уведомления',
                  style: TextStyle(
                      color: whiteTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isActive = !_isActive;
                  });
                },
                child: Switch(
                  value: _isActive,
                  onChanged: (bool value) {
                    setState(() {
                      _isActive = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Friends extends StatelessWidget {
  const _Friends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 58,
        width: 334,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: whiteTextColor),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.all(4),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15),
              Image.asset('assets/Icons/friends.png'),
              SizedBox(width: 40),
              Text('Рассказать друзьям',
                  style: TextStyle(
                      color: whiteTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}

class _UsingConditions extends StatelessWidget {
  const _UsingConditions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 58,
        width: 334,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: whiteTextColor),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.all(4),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15),
              Image.asset('assets/Icons/usingConditions.png'),
              SizedBox(width: 35),
              Text('Условия пользования',
                  style: TextStyle(
                      color: whiteTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}

class _PrivacyPolicy extends StatelessWidget {
  const _PrivacyPolicy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 58,
        width: 334,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: whiteTextColor),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.all(4),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15),
              Image.asset('assets/Icons/privacyPolicy.png'),
              SizedBox(width: 14),
              Text('Политика конфиденциальности',
                  style: TextStyle(
                      color: whiteTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Support extends StatelessWidget {
  const _Support({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 58,
        width: 334,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: whiteTextColor),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.all(4),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15),
              Image.asset('assets/Icons/support.png'),
              SizedBox(width: 40),
              Text('Служба поддержки',
                  style: TextStyle(
                      color: whiteTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}

class _LotusVersion extends StatelessWidget {
  const _LotusVersion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 58,
        width: 334,
        margin: const EdgeInsets.all(4),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 70),
              Image.asset('assets/Icons/Lotus.png'),
              SizedBox(width: 15),
              Text('Версия 1.1',
                  style: TextStyle(
                      color: whiteTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}
