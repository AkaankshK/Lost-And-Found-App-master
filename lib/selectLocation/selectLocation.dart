import 'package:flutter/material.dart';
import 'package:search_india/selectLocation/selectState.dart';

class SelectLocation extends StatefulWidget {
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  List<String> mainList = [
    "America",
    "Brazil",
    "Canada",
    "UAE",
    "England",
    "France",
    "Germany",
    "India"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Location"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: mainList.length,
                  itemBuilder: (_, int index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: InkWell(
                            onTap: () {
                              print("hello");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SelectState(index)));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(mainList[index]),
                                Icon(Icons.navigate_next)
                              ],
                            ),
                          ),
                        ),
                        Divider()
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
