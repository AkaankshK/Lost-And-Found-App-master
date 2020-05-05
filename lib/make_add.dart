

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:geolocator/geolocator.dart';
import 'package:search_india/add_mid.dart';
import 'package:search_india/register_page.dart';

class CreateAdd extends StatefulWidget {
  @override
  _CreateAddState createState() => _CreateAddState();
}

class _CreateAddState extends State<CreateAdd> {
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  List _tagItems=[
    "lost",
    "found"
  ];
  int a = 0;
  int b = 0;
  int c = 0;
  int c2 = 0;
  String brand;
  String lastloc;
  String name;
  String age;
  String gender;
  String color;
  bool val = false;
  bool negotiable = false;
  String reward = "0";
  String tags;
  String cityname;
  String subcategory = null;
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
      _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddress() async {
    try {
      List<Placemark> p = await geoLocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
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
   Widget city(){
    return DropdownButton<String>(

      hint:  Text("Select your City"),
      items: cities.map((String value){
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value){
        setState(() {
          cityname=value;

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
    'Physically Challenged'
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
  final keys = [
    'Car keys',
    'Other',
  ];

  final jewellery = [
    'Ring',
    'Bracelets',
    'Neckless',
    'Earrings',
    'Hand Bangles',
    'Others',
  ];

  final cities =[
    "Mumbai", "Delhi", "Bangalore", "Chennai", "Hyderabad", "Ahmedabad", "Kolkata"," Surat",
    "Pune", "Jaipur", "Lucknow", "Kanpur", "Nagpur", "Visakhapatnam", "Indore", "Thane", "Bhopal", "Pimpri-Chinchwad", "Patna", "Vadodara", "Ghaziabad", "Ludhiana", "Coimbatore", "Agra", "Madurai", "Nashik", "Vijayawada", "Faridabad", "Meerut", "Rajkot", "Kalyan-Dombivali", "Vasai-Virar", "Varanasi", "Srinagar", "Aurangabad", "Dhanbad", "Amritsar", "Navi Mumbai", "Allahabad", "Ranchi", "Howrah", "Jabalpur", "Gwalior", "Jodhpur", "Raipur", "Kota",
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

//TODO: Make alert list of options and add more
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.yellowAccent.withAlpha(255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text("Report what you found or Lost"),
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
                        color: Colors.black,),
                    children: <TextSpan>[
                      TextSpan(text: "Category "),
                      TextSpan(text: "*",style: TextStyle(color: Colors.red))
                    ]
                  ),
                )
              ),
//            IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: ,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: category(),
                ),
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
                                      : (selectedCurrency ==
                                              'Fashion Accessories')
                                          ? Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: androidDropdown2(fashion),
                                            )
                                          : (selectedCurrency == 'Jewellery')
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child:
                                                      androidDropdown2(jewellery),
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
                            color: Colors.black,),
                          children: <TextSpan>[
                            TextSpan(text: "Post Type "),
                            TextSpan(text: "*",style: TextStyle(color: Colors.red))
                          ]
                      ),
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
                                style:
                                    TextStyle(fontSize: 18, color: Colors.black),
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
                child:RichText(
                  text: TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,),
                      children: <TextSpan>[
                        TextSpan(text: "Title "),
                        TextSpan(text: "*",style: TextStyle(color: Colors.red))
                      ]
                  ),
                )
              ),
              TextFormField(

                validator: (value){
                  if(value.isEmpty){
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
                        color: Colors.black,),
                      children: <TextSpan>[
                        TextSpan(text: "Description "),
                        TextSpan(text: "*",style: TextStyle(color: Colors.red))
                      ]
                  ),
                )
              ),
              TextFormField(

                validator: (value){
                  if(value.isEmpty){
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
                child:RichText(
                  text: TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,),
                      children: <TextSpan>[
                        TextSpan(text: "Last Location of Lost & Found "),
                        TextSpan(text: "*",style: TextStyle(color: Colors.red))
                      ]
                  ),
                )
              ),
              TextFormField(

                validator: (value){
                  if(value.isEmpty){
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
                      selectedCurrency == "Jewellery" ||
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
                      selectedCurrency == "Jewellery" ||
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
                            name = val;
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
                  textField: TagsTextField(
                    width: MediaQuery.of(context).size.width,
                    hintText: "Enter a New Tag",
                    textStyle: TextStyle(fontSize: 18),
                    onSubmitted: (String str){
                      setState(() {
                        _tagItems.add(str);
                      });
                    }
                  ),
                  itemCount: _tagItems.length,
                  itemBuilder: (int index){
                    final item= _tagItems[index];
                    return ItemTags(
                      key: Key(index.toString()),
                      index: index,
                      title: item,

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
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,),
                      children: <TextSpan>[
                        TextSpan(text: "City "),
                        TextSpan(text: "*",style: TextStyle(color: Colors.red))
                      ]
                  ),
                )
              ),


//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Container(
//                child: city(),
//              ),
//            ),
              TextFormField(

                validator: (value){
                  if(value.isEmpty){
                    return "Please Enter City";
                  }
                  return null;
                },
                style: TextStyle(fontSize: 16, color: Colors.black),
                onChanged: (val) {
                  if (val != "" || val != null) cityname = val;
                },
                decoration: InputDecoration(
                  hintText: cityname == null ? 'City' : cityname,
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
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if(_formKey.currentState.validate()){

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
    var tagslist="";
    _tagItems.forEach((element) {
      tagslist+=element+",";
    });
    print(tagslist);
    return tagslist;
  }
}
