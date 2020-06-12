

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';


class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
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
    );
  }


}
