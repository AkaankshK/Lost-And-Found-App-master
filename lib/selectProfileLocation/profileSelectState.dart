import 'package:flutter/material.dart';
import 'package:search_india/main_page.dart';
import 'package:search_india/mpage.dart';
import 'package:search_india/profile.dart';

import '../user_display.dart';

class ProfileSelectState extends StatefulWidget {
  final int selectedCountry;
  final String uid;


  ProfileSelectState(this.selectedCountry, this.uid);

  @override
  _ProfileSelectStateState createState() => _ProfileSelectStateState();
}

class _ProfileSelectStateState extends State<ProfileSelectState> {
  bool loading=false;
  List<String> sample = [
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
    "Sample State",
  ];
  List<String> indiaList = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Lakshadweep",
    "Delhi",
    "Puducherry"
  ];

  uploadData(int index) async {
    await fireStore.collection('users').document(widget.uid).updateData({
      'city': widget.selectedCountry == 7 ? indiaList[index] : sample[index],
    });
    setState(() {
      loading=false;
    });
    cityName=widget.selectedCountry == 7 ? indiaList[index] : sample[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select State"),
      ),
      body:loading? Center(child: CircularProgressIndicator(),): SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.selectedCountry == 7
                      ? indiaList.length
                      : sample.length,
                  itemBuilder: (_, int index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                loading=true;
                              });
                              await uploadData(index);
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (BuildContext context) => MainPage()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(widget.selectedCountry == 7
                                    ? indiaList[index]
                                    : sample[index]),
                                Icon(Icons.done)
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
