import 'dart:ui';

import 'package:flutter/cupertino.dart';
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
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: (){
          Navigator.pop(context);
        }),
        title: Text('About Us', style: TextStyle(color: Colors.white),),
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
                height: MediaQuery
                    .of(context)
                    .size
                    .width / 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
//              child: Image(
//                image: AssetImage('images/splash.png'),
//                fit: BoxFit.fill,
//                height: 200,
//                width: 200,
//              ),
                  child: Center(
                    child: Text(
                      'Lost & Found',
                      style: TextStyle(fontSize: 42,
                          fontFamily: "Playfair", fontWeight: FontWeight.w600,


                          color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc arcu nulla, iaculis et commodo facilisis, consectetur at magna. Etiam imperdiet nisi posuere hendrerit rhoncus. Aenean magna turpis, sodales at nisi nec, posuere tempus mi. Mauris dapibus magna eget tellus accumsan, quis vulputate enim porttitor. Quisque lorem quam, faucibus ac pulvinar non, varius pulvinar erat. Pellentesque eu orci ipsum. Praesent id odio ornare ante iaculis fermentum. Cras euismod, turpis non bibendum pretium, magna urna imperdiet odio, in pellentesque urna arcu nec nibh. Nam ut purus sit amet odio rutrum venenatis vitae non nibh. Aenean auctor velit neque, at lobortis tortor vehicula in. Ut convallis dolor in libero malesuada vulputate.\n\n'
                      'Aenean commodo pretium dolor a vestibulum. Duis tellus augue, sagittis eget quam sed, maximus fringilla lectus. Aliquam vel arcu lacus. Aliquam ipsum magna, viverra non semper eu, volutpat non leo. Etiam ultrices consectetur egestas. Suspendisse sodales sem at metus ultrices tristique. Suspendisse sed dui nulla. Sed sodales nec mauris at viverra. Phasellus nec sapien vel sem sodales sodales at vulputate neque. Ut imperdiet sem ut dictum cursus. Nunc tortor est, tincidunt ac urna ut, varius mollis dui. Etiam lacinia, risus finibus mollis fringilla, tortor mi mattis purus, sed dignissim nibh ipsum nec neque. In laoreet nulla ante, ut rhoncus neque convallis quis. Mauris pretium elit a aliquam venenatis. Nam augue nulla, posuere sit amet dignissim quis, imperdiet quis nibh.',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'How This Works\n\n'
                      'Aenean commodo pretium dolor a vestibulum. Duis tellus augue, sagittis eget quam sed, maximus fringilla lectus. Aliquam vel arcu lacus. Aliquam ipsum magna, viverra non semper eu, volutpat non leo. Etiam ultrices consectetur egestas. Suspendisse sodales sem at metus ultrices tristique. Suspendisse sed dui nulla. Sed sodales nec mauris at viverra. Phasellus nec sapien vel sem sodales sodales at vulputate neque. Ut imperdiet sem ut dictum cursus. Nunc tortor est, tincidunt ac urna ut, varius mollis dui. Etiam lacinia, risus finibus mollis fringilla, tortor mi mattis purus, sed dignissim nibh ipsum nec neque. In laoreet nulla ante, ut rhoncus neque convallis quis. Mauris pretium elit a aliquam venenatis. Nam augue nulla, posuere sit amet dignissim quis, imperdiet quis nibh.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Opensans",
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .width / 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
//              child: Image(
//                image: AssetImage('images/splash.png'),
//                fit: BoxFit.fill,
//                height: 200,
//                width: 200,
//              ),
                  child: Center(
                    child: Text(
                      'LOGO',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
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
                        Text(
                          'youremail@here.com',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.indigo,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Phone:   '),
                        Text(
                          '+91 0000000000',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.indigo,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Text('Website: '),
                        Text(
                          'websitename.com',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.indigo,
                              decoration: TextDecoration.underline),
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
                        Image.asset("images/fb.png"),
                        Image.asset("images/utube.png"),
                        Image.asset("images/linkedin.png"),
                        Image.asset("images/wmail.png"),
                        Image.asset("images/insta.png"),
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
}
