import 'package:flutter/material.dart';
import 'package:search_india/mpage.dart';

class SelectState extends StatefulWidget {
  final int selectedCountry;

  SelectState(this.selectedCountry);

  @override
  _SelectStateState createState() => _SelectStateState();
}

class _SelectStateState extends State<SelectState> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select State"),
      ),
      body: SingleChildScrollView(
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
                            onTap: () {
                              addressSet=true;
                              currentLocation=widget.selectedCountry==7?indiaList[index]:sample[index];
                              Navigator.pop(context);
                              Navigator.pop(context);
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
