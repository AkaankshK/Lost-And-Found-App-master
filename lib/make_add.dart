import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:search_india/add_mid.dart';
import 'package:search_india/register_page.dart';
import 'package:search_india/selectLocation/Location.dart';
import 'package:search_india/selectLocation/selectDistrict.dart';
import 'package:rxdart/rxdart.dart';

String apiKey = "AIzaSyD8IRf3qxELm874q-zPVKgo79xs0PJIwro";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: apiKey);


class CreateAdd extends StatefulWidget {
  @override
  _CreateAddState createState() => _CreateAddState();
}

class _CreateAddState extends State<CreateAdd> {
  double lat = null;
  double lng = null;
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  //GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  final cityController = new TextEditingController();
  String cityname="";
  List _tagItems = ["lost", "found"];
  String currentText = "";
  int a = 0;
  int b = 0;
  int c = 0;
  int c2 = 0;
  String brand;
  String lastloc;
  String name;
  String imei;
  String serialno;
  String age;
  String gender;
  String color;
  bool val = false;
  bool negotiable = false;
  String reward = "0";
  String tags;
  String title;
  String subcategory;
  String desc;
  String selectedCurrency = null;
  String getCity;
  final currenciesList = [
    //TODO: Add more
    'Mobile',
    'People',
    'Pets',
    'Automobile',
    'Bags',
    'Documents',
    'Laptop',
    'Jewellery',
    'Fashion Accessories',
    'Keys',
    'Watches',
    'Toys',
    'Sports Equipment',
    'Other',
  ];
  Position _currentPosition;

  _getCurrentLocation() {
    geoLocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position p) {
      setState(() {
        _currentPosition = p;
      });
      _getAddress(_currentPosition.latitude, _currentPosition.longitude);
    }).catchError((e) {
      print(e);
    });
  }

  _getAddress(double lat, double lng) async {
    try {
      List<Placemark> p = await geoLocator.placemarkFromCoordinates(lat, lng);
      Placemark place = p[0];

      setState(() {
        cityname = "${place.locality}";
        print(cityname);
      });
    } catch (e) {
      print(e);
    }
  }

  Widget category() {
    return new DropdownButton<String>(
      value: selectedCurrency,
      hint: Text("Please select a category"),
      items: currenciesList.map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (selectedValue) {
        setState(() {
          selectedCurrency = selectedValue;
          subcategory = null;
        });
      },
    );
  }

  Widget ageList() {
    return DropdownButton<String>(
      value: age,
      hint: Text("Select Age"),
      items: agelist.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          age = value;
        });
      },
    );
  }

  DropdownButton<String> androidDropdown2(currenciesList) {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Row(
          children: <Widget>[
//            RadioListTile(
//                value: 1,
//                title: Text(currency),
//                groupValue: c2,
//                onChanged: (ch) {
//                  setState(() {
//                    c2 = ch;
//                  });
//                }),

            Text(currency),
          ],
        ),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: subcategory,
      hint: Text("Please select a sub-category"),
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          subcategory = value;
        });
      },
    );
  }

  final agelist = ["1-17", "18-25", "26-30", "31-40", "41-50"];

  final keys = ["Car Keys", "Other Keys"];

  final sports = [
    "Cricket",
    "Gym Equiment",
    "Football",
    "Basketball",
    "Volleyball",
    "Badminton",
    "Tennis",
    "Other",
  ];

  final laptops = [
    "Dell",
    "HP",
    "Apple",
    "Acer",
    "Asus",
    "Others",
  ];

  final ist = [
    'Car',
    'Bike',
    'Cycle',
    'Scooty',
    'Auto Parts',
    'Boats',
    'Others'
  ];

  final bag = [
    'Luggage Bags',
    'School Bags',
    'Bagpacks',
    'Others',
    'Wallets',
    'Hand Bags',
    'Others'
  ];

  final ist1 = [
    'Baby Girl',
    'Baby Boy',
    'Male Kid',
    'Female Kid',
    'Boy',
    'Girl',
    'Man',
    'Woman',
    'Male Senior Citizen',
    'Female Senior Citizen',
    'Physically Challenged',
    'Senior citizen',
  ];
  final doc = [
    'Aadhar Card',
    'Pan Card',
    'ID Card',
    'Driving License',
    'Passport',
    'Mark Sheets',
    'Cheque',
    'Debit or Credit Cards',
    'Bank Document',
    'Property Document',
    "Others"
  ];
  final fashion = [
    'Caps',
    'Spectacles',
    'Other',
  ];
  final pets = ['Cats', 'Dogs', 'Cows', 'Others'];
  final phones = ['Android', 'iPhone', 'Tablets', 'Mobile Accessories'];

  final jewellery = [
    'Ring',
    'Bracelets',
    'Neckless',
    'Earrings',
    'Hand Bangles',
    'Others',
  ];

  final cities = [
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Chennai",
    "Hyderabad",
    "Ahmedabad",
    "Kolkata",
    " Surat",
    "Pune",
    "Jaipur",
    "Lucknow",
    "Kanpur",
    "Nagpur",
    "Visakhapatnam",
    "Indore",
    "Thane",
    "Bhopal",
    "Pimpri-Chinchwad",
    "Patna",
    "Vadodara",
    "Ghaziabad",
    "Ludhiana",
    "Coimbatore",
    "Agra",
    "Madurai",
    "Nashik",
    "Vijayawada",
    "Faridabad",
    "Meerut",
    "Rajkot",
    "Kalyan-Dombivali",
    "Vasai-Virar",
    "Varanasi",
    "Srinagar",
    "Aurangabad",
    "Dhanbad",
    "Amritsar",
    "Navi Mumbai",
    "Allahabad",
    "Ranchi",
    "Howrah",
    "Jabalpur",
    "Gwalior",
    "Jodhpur",
    "Raipur",
    "Kota",
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }
//
//  @override
//  void dispose() {
//    cityController.dispose();
//    super.dispose();
//  }

//TODO: Make alert list of options and add more
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldKey,
//      backgroundColor: Colors.yellowAccent.withAlpha(255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text("Report what you Found or Lost"),
        ),
      ),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: Colors.black,
                padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                child: Text(
                  'Post Details',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Category "),
                          TextSpan(
                              text: "*", style: TextStyle(color: Colors.red))
                        ]),
                  )),
//            IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: ,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: category()),
              ),
              (selectedCurrency == 'Mobile')
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: androidDropdown2(phones),
                    )
                  : (selectedCurrency == 'Automobile')
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: androidDropdown2(ist),
                        )
                      : (selectedCurrency == 'Pets')
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: androidDropdown2(pets),
                            )
                          : (selectedCurrency == 'People')
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: androidDropdown2(ist1),
                                )
                              : (selectedCurrency == 'Bags')
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: androidDropdown2(bag),
                                    )
                                  : (selectedCurrency == 'Documents')
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: androidDropdown2(doc),
                                        )
                                      : (selectedCurrency == 'Keys')
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: androidDropdown2(keys),
                                            )
                                          : (selectedCurrency ==
                                                  'Fashion Accessories')
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child:
                                                      androidDropdown2(fashion),
                                                )
                                              : (selectedCurrency == 'Laptop')
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: androidDropdown2(
                                                          laptops),
                                                    )
                                                  : (selectedCurrency ==
                                                          'Sports Equipment')
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              androidDropdown2(
                                                                  sports),
                                                        )
                                                      : (selectedCurrency ==
                                                              'Jewellery')
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  androidDropdown2(
                                                                      jewellery),
                                                            )
                                                          : Container(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: "Post Type "),
                            TextSpan(
                                text: "*", style: TextStyle(color: Colors.red))
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Radio(
                                value: 0,
                                activeColor: Colors.black,
                                onChanged: (i) {
                                  setState(() {
                                    a = i;
                                  });
                                },
                                groupValue: a,
                              ),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.black)),
                                ),
                                child: Text(
                                  'Lost',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Radio(
                                value: 1,
                                activeColor: Colors.black,
                                onChanged: (i) {
                                  setState(() {
                                    a = i;
                                  });
                                },
                                groupValue: a,
                              ),
                              Text(
                                'Found',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.withAlpha(100),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Title "),
                          TextSpan(
                              text: "*", style: TextStyle(color: Colors.red))
                        ]),
                  )),
              TextFormField(
                onChanged: (val){
                  title=val;
                  print(title);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Title";
                  }
                  return null;
                },
                style: TextStyle(fontSize: 16, color: Colors.black),
                textCapitalization: selectedCurrency == "VEHICLES"
                    ? TextCapitalization.characters
                    : TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'A great title needs atleast 60 characters',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Description "),
                          TextSpan(
                              text: "*", style: TextStyle(color: Colors.red))
                        ]),
                  )),
              TextFormField(
                maxLines: 2,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Description";
                  }
                  return null;
                },
                onChanged: (val) {
                  desc = val;
                },
                style: TextStyle(fontSize: 16, color: Colors.black),
                decoration: InputDecoration(
                  hintText:
                      'Describe important information clearly like color, feature, etc',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Last Location of Lost & Found "),
                          TextSpan(
                              text: "*", style: TextStyle(color: Colors.red))
                        ]),
                  )),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Last seen Location";
                  }
                  return null;
                },
                onChanged: (val) {
                  lastloc = val;
                },
                style: TextStyle(fontSize: 16, color: Colors.black),
                decoration: InputDecoration(
                  hintText:
                      'Please enter the last location, like exact place, bus, time, etc.',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),

              (selectedCurrency == "Other" ||
                      selectedCurrency == "Automobile" ||
                      selectedCurrency == "Sports Equipment" ||
                      selectedCurrency == "Jewellery" ||
                      selectedCurrency == "Mobile" ||
                      selectedCurrency == "Toys" ||
                      selectedCurrency == "Fashion Accessories" ||
                      selectedCurrency == "Keys" ||
                      selectedCurrency == "Laptop")
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            'Brand',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (val) {
                            brand = val;
                          },
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Enter Brand name if applicable',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  : Container(),

              (selectedCurrency == "Other" ||
                      selectedCurrency == "Automobile" ||
                      selectedCurrency == "Sports Equipment" ||
                      selectedCurrency == "Jewellery" ||
                      selectedCurrency == "Mobile" ||
                      selectedCurrency == "Toys" ||
                      selectedCurrency == "Fashion Accessories" ||
                      selectedCurrency == "Keys" ||
                      selectedCurrency == "Laptop")
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            'Color',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (val) {
                            color = val;
                          },
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Specify color if applicable',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  : Container(),

              (selectedCurrency == "Other" ||
                      selectedCurrency == "Automobile" ||
                      selectedCurrency == "Sports Equipment" ||
                      selectedCurrency == "Jewellery" ||
                      selectedCurrency == "Mobile" ||
                      selectedCurrency == "Toys" ||
                      selectedCurrency == "Fashion Accessories" ||
                      selectedCurrency == "Keys" ||
                      selectedCurrency == "Laptop")
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            'Model',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (val) {
                            color = val;
                          },
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Specify Model if applicable',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  : Container(),
              (selectedCurrency == "People")
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (val) {
                            name = val;
                          },
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Please mention name of the person',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "Age "),
                                  TextSpan(
                                      text: "*",
                                      style: TextStyle(color: Colors.red))
                                ]),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: ageList()),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  : Container(),
              (selectedCurrency == "Pets")
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: "Sex "),
                                    TextSpan(
                                        text: "*",
                                        style: TextStyle(color: Colors.red))
                                  ]),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Radio(
                                        value: 0,
                                        activeColor: Colors.black,
                                        onChanged: (i) {
                                          setState(() {
                                            b = i;
                                          });
                                        },
                                        groupValue: b,
                                      ),
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black)),
                                        ),
                                        child: Text(
                                          'Male',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Radio(
                                        value: 1,
                                        activeColor: Colors.black,
                                        onChanged: (i) {
                                          setState(() {
                                            b = i;
                                          });
                                        },
                                        groupValue: b,
                                      ),
                                      Text(
                                        'Female',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (val) {
                            name = val;
                          },
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Please mention Name of the pet',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            'Color',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (val) {
                            color = val;
                          },
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Please mention color of the pet',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (val) {
                            age = val;
                          },
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Specify the age',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  : Container(),

              (selectedCurrency == "Mobile")
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            'IMEI NUMBER',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (val) {
                            imei = val;
                          },
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Enter IMEI Number',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            'Serial Number',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (val) {
                            serialno = val;
                          },
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Enter Serial Number",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  : Container(),
              (selectedCurrency == "Documents" || selectedCurrency == "Keys")
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            'Serial Number',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (val) {
                            serialno = val;
                          },
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Enter Serial Number",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  : Container(),
              (selectedCurrency == "Automobile")
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            'Registration Number',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        TextField(
                          onChanged: (val) {
                            serialno = val;
                          },
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Enter Registration Number",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ],
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                ),
                child: Text(
                  'Reward (in INR)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                onChanged: (val) {
                  reward = val;
                },
                keyboardType: TextInputType.numberWithOptions(),
                style: TextStyle(fontSize: 16, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter Reward in ₹ if applicable',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                      value: negotiable,
                      activeColor: Colors.black,
                      onChanged: (i) {
                        setState(() {
                          negotiable = i;
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey,
                      ))),
                      child: Text('Is Reward Negotiable?')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Text(
                  'Tags',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Tags(
                  key: _tagStateKey,
//                textField: TagsTextField(
//                    enabled: false,
//                    width: MediaQuery.of(context).size.width,
//                    hintText: "Enter a New Tag",
//                    textStyle: TextStyle(fontSize: 18),
//                    onSubmitted: (String str) {
//                      setState(() {
//                        _tagItems.add(str);
//                      });
//                    }),
                  itemCount: _tagItems.length,
                  itemBuilder: (int index) {
                    final item = _tagItems[index];
                    return ItemTags(
                      key: Key(index.toString()),
                      index: index,
                      title: item,
                      pressEnabled: false,
                      textStyle: TextStyle(fontSize: 20),
                      combine: ItemTagsCombine.withTextBefore,

//                    removeButton: ItemTagsRemoveButton(
//                      onRemoved: (){
//                        setState(() {
//                          _tagItems.remove(index);
//                          print(_tagItems);
//                        });
//                        return true;
//                      }
//                    ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(hintText: "Enter Tags"),
                  onSubmitted: (val) {
                    setState(() {
                      _tagItems.add(val);
                    });
                  },
                ),
              ),

              Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "City "),
                          TextSpan(
                              text: "*", style: TextStyle(color: Colors.red))
                        ]),
                  )),

//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Container(
//                child: city(),
//              ),
//            ),
//              SimpleAutoCompleteTextField(
//                key: key,
//                submitOnSuggestionTap: true,
//                clearOnSubmit: false,
//                suggestions: getCityList(),
////                validator: (value){
////                  if(value.isEmpty){
////                    return "Please Enter City";
////                  }
////                  return null;
////                },
//                style: TextStyle(fontSize: 16, color: Colors.black),
//                textSubmitted: (val) {
//                  setState(() {
//                    cityname = val;
//                    currentText = val;
//                    print(cityname);
//                  });
//                },
//
//                textChanged: (val) {
//                  setState(() {
//                    cityname = val;
//                    currentText = val;
//                    print(cityname);
//                  });
//                },
//
//                decoration: InputDecoration(
//                  hintText: currentText == null ? 'City' : currentText,
//                  hintStyle: TextStyle(color: Colors.grey),
//                  border: OutlineInputBorder(
//                    borderSide: BorderSide.none,
//                  ),
//                ),
//              ),
              StatefulBuilder(
                builder: (context, setState) {
                  return TextField(
                    onChanged: (val){
                      setState(() {
                        cityname=val;
                      });
                    },
                    controller: cityController,
                    decoration: InputDecoration(
                      hintText: cityname == null ? 'City' : cityname,
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onTap: () async {
                      Prediction p = await PlacesAutocomplete.show(
                        onError: onError,
                        mode: Mode.overlay,
                        radius: 30000,
                        context: context,
                        apiKey: apiKey,
                        language: "en",
                      );
                      if (p != null) {
                        PlacesDetailsResponse detail =
                            await _places.getDetailsByPlaceId(p.placeId);
                        lat = detail.result.geometry.location.lat;
                        lng = detail.result.geometry.location.lng;
                        List<Placemark> p1 =
                            await geoLocator.placemarkFromCoordinates(lat, lng);
                        Placemark place = p1[0];
                        setState(() {
                          cityname = place.locality;
                          print(cityname);
                          cityController.text = place.locality;
                          print(cityController.text);
                        });
                      }
                    },
                  );
                },
              ),
//              TextFormField(
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return "Please Select City";
//                    }
//                    return null;
//                  },
//                controller: cityController,
//                decoration: InputDecoration(
//                  hintText: cityname == null ? 'City' : cityname,
//                  hintStyle: TextStyle(color: Colors.grey),
//                  border: OutlineInputBorder(
//                    borderSide: BorderSide.none,
//                  ),
//                ),
//                onTap: () {
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationPage()));
//                }
//              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    getAdditinalInfo();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MakeAdd(
                          map: {
                            'reward': reward == null ? "0" : reward,
                            'category': selectedCurrency,
                            'subcategory': subcategory,
                            'posttype': a.toString(),
                            'city': cityname,
                            'desc': desc,
                            'tags': getTags(),
                            'additionalinfo':getAdditinalInfo(),
                          },
                        ),
                      ),
                    );
                  }
                },
                child: Center(
                  child: Container(
                    width: 240,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        color: Colors.black),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  String getTags() {
    var tagslist = "";
    _tagItems.forEach((element) {
      tagslist += element + ",";
    });
    print(tagslist);
    return tagslist;
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  getAdditinalInfo() {
    var additionalInfo={};

    if(title!=null){
      additionalInfo['title']=title;
    }
    if(lastloc!=null){
      additionalInfo['last_location']=lastloc;
    }
    if(brand!=null){
      additionalInfo['brand']=brand;
    }
    if(color!=null){
      additionalInfo['color']=color;
    }
    if(serialno!=null){
      additionalInfo['serialno']=serialno;
    }
    if(name!=null){
      additionalInfo['name']=name;
    }
    if(age!=null){
      additionalInfo['age']=age;
    }
    if(imei!=null){
      additionalInfo['imei']=imei;
    }
    print(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day).toString());
    additionalInfo['date']=DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day).toString();
    additionalInfo['negotiable']=negotiable;
    print(additionalInfo);
    return additionalInfo;

  }
//  @override
//  void dispose() {
//    cityController.clear();
//    super.dispose();
//  }
}
