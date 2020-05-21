

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String apiKey="AIzaSyD8IRf3qxELm874q-zPVKgo79xs0PJIwro";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  getBody() {
    return Column(
      children: [
      Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          height: 75,
          width: MediaQuery.of(context).size.width,
          child: TextField(
            onTap: ()async{
              Prediction p = await PlacesAutocomplete.show(
                context: context,
                apiKey: apiKey,
                language: "en",
              );
            },
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search)
            ),
          ),
        ),
      )
      ],
    );
  }
}
