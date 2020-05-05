

import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Locale english = Locale("en", "IN");
Locale hindi = Locale("hi", "IN");
Locale bengali = Locale("bn", "IN");
Locale gujrati = Locale("gu", "IN");
Locale marathi = Locale("mr", "IN");
Locale tamil = Locale("ta", "IN");
Locale spanish = Locale("es", "ES");

int lng = 10;

class CustomDialog extends StatelessWidget {
  final String title, one, two, three;

  CustomDialog(
    this.title,
    this.one,
    this.two,
    this.three,
  );

  Widget lang(
      BuildContext context, Locale language, String showlang, int selected) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            EasyLocalization.of(context).locale = language;
            Navigator.pop(context);
            lng = selected;
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                showlang,
                textAlign: TextAlign.left,
                style: TextStyle(
//                    color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
              Radio(
                value: selected,
                groupValue: lng,
                onChanged: (val) {
                  lng = selected;
                },
                activeColor: Theme.of(context).accentColor,
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 1,
          indent: 0,
          endIndent: 10,
          height: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Consts.padding),
//          boxShadow: [
//            BoxShadow(
//              color: Colors.black26,
//              blurRadius: 10.0,
//              offset: const Offset(0.0, 10.0),
//            ),
//          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  title,
//              textAlign: TextAlign.center,
                  style: TextStyle(
//                color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                lang(context, english, 'English', 0),
                lang(context, hindi, 'Hindi', 1),
                lang(context, bengali, 'Bengali', 2),
                lang(context, marathi, 'Marathi', 3),
                lang(context, tamil, 'Tamil', 4),
                lang(context, gujrati, 'Gujrati', 5),
                lang(context, spanish, 'Spanish', 6),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 12.0;
}
