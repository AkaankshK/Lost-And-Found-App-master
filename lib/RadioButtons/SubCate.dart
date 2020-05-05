import 'package:flutter/material.dart';

class SubCategory extends StatefulWidget {
  @override
  SubCategoryState createState() {
    return new SubCategoryState();
  }
}

class NumberList {
  String number;
  int index;

  NumberList({this.number, this.index});
}

String radioItemHolder = 'One';

// Group Value for Radio Button.
int id = 1;

List<NumberList> nList = [
  NumberList(
    index: 1,
    number: "Ring",
  ),
  NumberList(
    index: 2,
    number: "Bracelets",
  ),
  NumberList(
    index: 3,
    number: "Neckless",
  ),
  NumberList(
    index: 4,
    number: "Earrings",
  ),
  NumberList(
    index: 5,
    number: "Hand Bangles",
  ),
  NumberList(
    index: 6,
    number: "Others",
  ),

];

class SubCategoryState extends State<SubCategory> {
  int _currentIndex = 1;

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('Sub Category*'),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                )
              ],
            ),
            content: Container(
              width: double.maxFinite,
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: nList
                          .map((data) => RadioListTile(
                        title: Text("${data.number}"),
                        groupValue: id,
                        value: data.index,
                        onChanged: (val) {
                          setState(() {
                            radioItemHolder = data.number;
                            id = data.index;
                          });
                        },
                      ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Divider(
                thickness: 1,
                color: Colors.black,
              )
              ,
              new FlatButton(
                child: new Text('CANCEL',
                  style: TextStyle(
                      color: Colors.yellow
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('OKAY', style: TextStyle(
                    color: Colors.yellow
                ),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioButton in AlertDialog'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Alert Dialog'),
          color: Colors.red,
          onPressed: () => _displayDialog(context),
        ),
      ),
    );
  }
}
