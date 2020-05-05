import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_india/login_page.dart';
import 'package:search_india/main_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

final _auth = FirebaseAuth.instance;
FirebaseUser loggedInUser;
bool loggedIn = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getCurrentUser();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale('hi', 'IN'),
        Locale('en', 'IN'),
        Locale('bn', 'IN'),
        Locale('mr', 'IN'),
        Locale('ta', 'IN'),
        Locale('gu', 'IN'),
        Locale('es', 'ES')
      ],
      path: 'resources/language_json',
    ));
  });
}

void getCurrentUser() async {
  try {
    var user = await _auth.currentUser();
    if (user != null) {
      loggedInUser = user;
      if (user.isEmailVerified) {
        loggedIn = true;
      }
    }
  } catch (e) {
    print(e);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey[300],
        accentColor: Colors.yellow.shade600,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
          ),
          body1: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      home: loggedIn ? MainPage() : LoginPage(),
    );
  }
}
