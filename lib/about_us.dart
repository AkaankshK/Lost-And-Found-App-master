import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:image_picker/image_picker.dart';
import 'package:search_india/chat.dart';
import 'package:search_india/my_flutter_app_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'About Us',
          style: TextStyle(color: Colors.white),
        ),
//        actions: <Widget>[
//          IconButton(
//            icon: SvgPicture.asset("images/Icon ionic-ios-chatboxes.svg"),
//            onPressed: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => Chat('Admin', false)));
//            },
//          ),
//        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/maskGroup3.png'),
          fit: BoxFit.fitWidth,
        )),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/logo search.png"))),
              ),
              Container(
                height: 100,
                child: Center(
                  child: Text(
                    'Lost & Found',
                    style: TextStyle(
                        fontSize: 42,
                        fontFamily: "Playfair",
                        fontWeight: FontWeight.w600,
                        color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
//                child: Text(
//
//                  // "www.globalsearch.com, is the global search Digital platform where anyone can report their lost and found items. Every found item will be matched with the lost items to reunite with the lawful owner. With more than 99% recovery rate, www.globalsearchnetworks.com deliver secure and convenient service for its users.",
////                  textAlign: TextAlign.justify,
//                  style: TextStyle(
//                    fontSize: 16,
//                    letterSpacing: 0.8,
//                  ),
//                ),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "www.searchglobalnetworks.com",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.indigo,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchWebsite(
                              "https://www.searchglobalnetworks.com")),
                    TextSpan(
                        text:
                            " is the global search Digital platform where anyone can report their lost and found items. Every found item will be matched with the lost items to reunite with the lawful owner. With more than 99% recovery rate, ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                    TextSpan(
                        text: "www.searchglobalnetworks.com",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.indigo,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchWebsite(
                              "https://www.searchglobalnetworks.com")),
                    TextSpan(
                        text:
                            " deliver secure and convenient service for its users.",
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      "How does ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () =>
                          launchWebsite("https://www.globalsearchnetworks.com"),
                      child: Text("globalsearchnetworks.com",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.indigo,
                              decoration: TextDecoration.underline)),
                    ),
                    Text(" work?",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "One can log in and create the ad on the large community where everybody potentially take action in searching for what you have lost. Any form of payment can be done in the form of reward on receipt of your lost belongings.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Opensans",
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Follow the given three steps to create the ad.",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Opensans",
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "1. Register with your mobile number and email address.\n\n2. Confirm your registration through the verification link which has sent to the given email address.\n\n3. Start creating ad.\n\nThis independent reporting service allows you to use the same account again for multiple ads without any registration fee.",
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/logo search.png"),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Email:   '),
                        GestureDetector(
                          onTap: () =>
                              launchWebsite("mailto:globalsearch24@gmail.com"),
                          child: Text(
                            'globalsearch24@gmail.com',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.indigo,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Phone:   '),
                        GestureDetector(
                          onTap: () => launchWebsite("tel:+91 7605844146"),
                          child: Text(
                            '+91 7605844146',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.indigo,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Website: '),
                        GestureDetector(
                          onTap: () => launchWebsite(
                              "https://www.globalsearchnetworks.com"),
                          child: Text(
                            'www.globalsearchnetworks.com',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.indigo,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text('Follow us on social media\n'),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                            onTap: () => launchWebsite(
                                "https://www.facebook.com/Global-Search-Lost-Found-100203234996153/?ref=aymt_homepage_panel&eid=ARDc52O0Z1qP4A_YlySlNnQ7_rv6K4k2VjUB_KgDPVn4rhL8vSg_jBTvKj-h3vwzKP78tBXQvt8dnhAq"),
                            child: Image.asset("images/fb.png")),
                        InkWell(
                            onTap: () =>
                                launchWebsite("https://youtu.be/QncidaRh4Sk"),
                            child: Image.asset("images/utube.png")),
                        InkWell(
                            onTap: () => launchWebsite(
                                "https://www.linkedin.com/in/global-search-b237871a8/"),
                            child: Image.asset("images/linkedin.png")),
                        InkWell(
                          child: Image.asset("images/insta.png"),
                          onTap: () => launchWebsite(
                              "https://www.instagram.com/globalsearchlost/?hl=en"),
                        ),
                        InkWell(
                            onTap: () =>
                                launchWebsite("https://twitter.com/LostGlobal"),
                            child: Image.asset("images/twitter.png")),
                        //TODO: delete unneccessary pngs and change image icons to SVG coz they are working
                      ],
                    ),

//                    IconButton(
//                      icon: Icon(
//                        Icons.phone,
////                      color: Colors.tealAccent,
//                      ),
//                      onPressed: () async {
//                        String url = 'tel:8837342435';
//                        if (await canLaunch(url)) {
//                          await launch(url);
//                        } else {
//                          throw 'Could not launch $url';
//                        }
//                      },
//                    ),
//                    IconButton(
//                      icon: Icon(
//                        Icons.mail,
//                        color: Colors.tealAccent,
//                      ),
//                      onPressed: () async {
//                        String url =
//                            'mailto:searchindia27@gmail.com?subject=SearchIndiaAppFeedback.';
//                        if (await canLaunch(url)) {
//                          await launch(url);
//                        } else {
//                          throw 'Could not launch $url';
//                        }
//                      },
//                    ),
//                    IconButton(
//                      icon: Icon(
//                        MyFlutterApp.whatsapp,
//                        color: Colors.tealAccent,
//                      ),
//                      onPressed: () {
//                        FlutterOpenWhatsapp.sendSingleMessage(
//                            "918837342435", "Feedback:\n");
//                      },
//                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  launchWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
