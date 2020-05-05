

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:search_india/customDialogBox.dart';
import 'package:search_india/categ_adds.dart';
import 'package:search_india/first_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/scheduler.dart';
import 'package:search_india/lost_found.dart';
import 'selectLocation/selectLocation.dart';
import 'package:search_india/view_all.dart';
import 'about_us.dart';

String currentLocation = "";
bool addressSet = false;

class MainPage2 extends StatefulWidget {
  @override
  _MainPage2State createState() => _MainPage2State();
}

class _MainPage2State extends State<MainPage2>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  ScrollController scrollController;
  Position _currentPosition;
  String _currentAddress = 'locate'.tr();
  final Geolocator geoLocator = Geolocator()..forceAndroidLocationManager;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    scrollController = ScrollController();
    SchedulerBinding.instance.addPostFrameCallback((_) => setState(() {
          if (!addressSet) {
            _getCurrentLocation();
          } else
            _currentAddress = currentLocation;
        }));
  }

//TODO: login button find and place
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
        currentLocation =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.location_on),
          onPressed: () {
            print('Hello');
            _getCurrentLocation();
          },
        ),
        title: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SelectLocation()));
            },
            child: Text(currentLocation)),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ViewAll()));
            },
            child: Icon(Icons.search),
          ),
          IconButton(
//            icon: SvgPicture.asset("images/Icon feather-info.svg"),
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
            },
          ),
          InkWell(
            onTap: () {
              _showDialog();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Center(
                  child: Text(
                'lng',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ).tr()),
            ),
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 560,
              flexibleSpace: FlexibleSpaceBar(
                //TODO: add animations if time persists
                background: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Wid1(),
                      Wid2(),

//                      Wid2(),
                      ListTile(
                        title: Text(
                          'new',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.8,
                            fontSize: 22,
                            color: Theme.of(context).textTheme.body1.color,
                          ),
                        ).tr(),
                        trailing: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: RaisedButton(
                            child: Text(
                              'see_all',
                              style: TextStyle(color: Colors.white),
                            ).tr(),
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewAll()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pinned: false,
              bottom: TabBar(
                controller: tabController,
                indicatorColor: Colors.black,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      "complete",
                    ).tr(),
                  ),
                  Tab(
                    child: Text(
                      "missing",
                    ).tr(),
                  ),
                  Tab(
                    child: Text(
                      "found_item",
                    ).tr(),
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            FirstScreen(false),
            LostFound('LOST'),
            LostFound('FOUND'),
          ],
          controller: tabController,
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
            //TODO: add more languages using JSON localization and for choose language
            "Select Language\n\n",
            "Eng".tr(),
            "Hindi".tr(),
            "Bang".tr(),
          );
        });
  }
}

class Wid1 extends StatefulWidget {
  @override
  _Wid1State createState() => _Wid1State();
}

class _Wid1State extends State<Wid1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 330,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/maskGroup3.png'),
//              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.exclusion),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(32),
                child: Center(
                    child: Text(
                  'LOGO',
                  style: TextStyle(fontSize: 60),
                )),
//            child: Row(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: <Widget>[
//                Expanded(
//                  child: Image(
//                    image: AssetImage('images/splash.png'),
//                    fit: BoxFit.cover,
//                  ),
//                ),
//                Expanded(
//                  child: Container(
//                    decoration: BoxDecoration(
//                      color: Colors.black.withOpacity(0.2),
//                    ),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 7.0),
//                          child: Text(
//                            'title',
//                            style: TextStyle(
//                                fontSize: 22,
//                                color: Colors.black,
//                                fontWeight: FontWeight.bold,
//                                letterSpacing: 1.2),
//                          ).tr(),
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 7),
//                          child: Text(
//                            ' Lost or Found ',
//                            style: TextStyle(
//                                fontSize: 18,
//                                color: Colors.white,
//                                letterSpacing: 1.2),
//                          ).tr(),
//                        ),
//                      ],
//                    ),
//                  ),
//                )
//              ],
//            ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//TODO: Change uneccessary stateful widgets to stateless

class Wid2 extends StatefulWidget {
  @override
  _Wid2State createState() => _Wid2State();
}

class _Wid2State extends State<Wid2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //TODO: if time make it into another widget
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds("MOBILE")));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection 2.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text("MOBILE").tr()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds("PEOPLE")));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection -1.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('PEOPLE').tr()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds("BAGS")));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection -4.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('BAGS').tr()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds("PETS")));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection -2.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('PETS').tr()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds("VEHICLES")));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection -3.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('VEHICLES').tr()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds('DOCUMENTS')));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection 4.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('DOCUMENTS').tr()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds("LAPTOP")));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection -5.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('LAPTOP').tr()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds("JEWELLERY")));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection -6.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('JEWELLERY').tr()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds("FASHION")));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection -7.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('FASHION').tr()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds("KEYS")));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection -8.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('KEYS').tr()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds("WATCHES")));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection -9.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('WATCHES').tr()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds("TOYS")));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection -10.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('TOYS').tr()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds("SPORTS")));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection -11.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('SPORTS').tr()
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategAdds("OTHERS")));
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/Intersection -12.png'),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('OTHERS').tr()
              ],
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
//TODO: Add Heroes of the month & Success stories

class Wid3 extends StatefulWidget {
  @override
  _Wid3State createState() => _Wid3State();
}

class _Wid3State extends State<Wid3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.yellowAccent,
          appBar: AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('VIEW ALL'),
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  onPressed: () {},
                ),
              )
            ],
            title: Text(
              'LatestPosts',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.yellowAccent,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "ALL",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "LOST",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "FOUND",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              FirstScreen(false),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
