import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:search_india/about_us.dart';
import 'package:search_india/chat.dart';
import 'package:search_india/make_add.dart';
import 'package:search_india/my_adds.dart';
import 'package:search_india/profile.dart';
import 'mpage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:io';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FirebaseMessaging _firebaseMessaging;

  void setUpFirebase() {
    _firebaseMessaging = FirebaseMessaging();
    firebaseCloudMessaging_Listeners();
  }

  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  int num = 0;
  final widgets = [
    MainPage2(),
    CreateAdd(),
    MyAdds(),
    Chat('Admin', false),
    Profile(),
  ];

  @override
  void initState() {
    super.initState();
    setUpFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widgets[num],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        currentIndex: num,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('home').tr(context: context),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            title: Text('new_ad').tr(),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('images/myads.png')),
            title: Text('our_ads').tr(),
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/chat.png')),
              title: Text('communicate').tr()),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('person').tr(),
          ),
        ],
        onTap: (a) {
          setState(() {
//            if (a == 4) {
//              num = 0;
//              Navigator.push(
//                  context, MaterialPageRoute(builder: (context) => Profile()));
//            } else
            num = a;
          });
        },
      ),
    );
  }
}
