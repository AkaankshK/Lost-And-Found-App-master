import 'package:flutter/material.dart';

class RadioButtonAlertDialog extends StatefulWidget {
  @override
  RadioButtonAlertDialogState createState() {
    return new RadioButtonAlertDialogState();
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
    number: "Mobile",
  ),
  NumberList(
    index: 2,
    number: "People",
  ),
  NumberList(
    index: 3,
    number: "Pets",
  ),
  NumberList(
    index: 4,
    number: "Automobile",
  ),
  NumberList(
    index: 5,
    number: "Bags",
  ),
  NumberList(
    index: 6,
    number: "Documents",
  ),
  NumberList(
    index: 7,
    number: "Laptop",
  ),
  NumberList(
    index: 8,
    number: "Jewelry",
  ),
  NumberList(
    index: 9,
    number: "Fashion Accessories",
  ),
  NumberList(
    index: 10,
    number: "Keys",
  ),
  NumberList(
    index: 11,
    number: "Clothes & SHoes",
  ),
  NumberList(
    index: 12,
    number: "Watches",
  ),
  NumberList(
    index: 13,
    number: "Toys",
  ),
  NumberList(
    index: 14,
    number: "Sports Equipment",
  ),
  NumberList(
    index: 15,
    number: "Other",
  ),
];

class RadioButtonAlertDialogState extends State<RadioButtonAlertDialog> {
  int _currentIndex = 1;

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Category*'),
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
