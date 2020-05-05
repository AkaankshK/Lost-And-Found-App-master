import 'package:flutter/material.dart';
import 'package:search_india/selectLocation/selectState.dart';
import 'package:search_india/selectProfileLocation/profileSelectState.dart';

class ProfileSelectLocation extends StatefulWidget {
  final String uid;

  ProfileSelectLocation(this.uid);

  @override
  _ProfileSelectLocationState createState() => _ProfileSelectLocationState();
}

class _ProfileSelectLocationState extends State<ProfileSelectLocation> {
  List<String> mainList = [
    "America",
    "Brazil",
    "Canada",
    "Dubai",
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
                                          ProfileSelectState(index, widget.uid)));
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
