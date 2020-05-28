

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:search_india/selectLocation/selectDistrict.dart';
import 'package:search_map_place/search_map_place.dart';

import '../make_add.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String apiKey="AIzaSyD8IRf3qxELm874q-zPVKgo79xs0PJIwro";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select City"),
        leading: FlatButton(
          child: IconButton(
            icon: Icon(Icons.close,color: Colors.black,size: 30,),
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: getBody(),
    );
  }

  getBody() {
    return SearchMapPlaceWidget(
        apiKey: apiKey,
    );
  }
}
