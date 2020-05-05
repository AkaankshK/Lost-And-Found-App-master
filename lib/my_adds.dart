import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:search_india/itemDetail.dart';
import 'package:share/share.dart';

import 'dataModel.dart';
import 'login_page.dart';

class MyAdds extends StatefulWidget {
  @override
  _MyAddsState createState() => _MyAddsState();
}

class _MyAddsState extends State<MyAdds> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'My Ads',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.orangeAccent,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "ADs",
                  style: TextStyle(color: Colors.orangeAccent),
                ),
              ),
              Tab(
                child: Text(
                  "FAVORITES",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/maskGroup3.png'),
                  fit: BoxFit.fill)),
          child: TabBarView(
            children: <Widget>[
              MyAddScreen(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAddScreen extends StatefulWidget {
  @override
  _MyAddScreenState createState() => _MyAddScreenState();
}

class _MyAddScreenState extends State<MyAddScreen> {
  String imgage, category, status, city, uid1;
  List<DataModel> dataList = List();
  final firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedinuser;
  bool loading = false;
  List<MyAds> list = <MyAds>[];

  Future getCurrentUser() async {
    try {
      loading = true;
      var user = await _auth.currentUser();
      if (user != null) {
        loggedinuser = user;
        uid1 = user.uid;
      } else {
        showDialog(
          context: context,
          child: Column(
            children: <Widget>[
              AlertDialog(
                title: Text(
                    'Please turn on the Internet and login, to access the features.\n If still not yet registered, then register and login.'),
              ),
              RaisedButton(
                  elevation: 10,
                  child: Text(
                    'Register/Login',
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }),
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future loadData() async {
    try {
      var data = await firestore
          .collection('adds')
          .orderBy('timestamp', descending: true)
          .getDocuments();
      for (var doc in data.documents) {
        if (doc.data['uid'] == uid1) {
          list.add(
            MyAds(
              name: doc.data['category'],
              location: doc.data['city'],
              status: doc.data['posttype'],
              img: doc.data['uri'][0],
              reward: doc.data['reward'],
              docId: doc.documentID,
            ),
          );
          dataList.add(
            DataModel(
                doc.data['category'],
                doc.data['city'],
                doc.data['posttype'],
                doc.data['uri'],
                doc.data['reward'],
                doc.data['desc'],
                doc.data['uid'],
                doc.data['phone'],
                doc.data['tags'],
                ),
          );
        }
        setState(() {
          loading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    loadData();
  }

  bool fav = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight * 2) / 2;
    final double itemWidth = size.width / 2;

    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemBuilder: (context, val) {
            return Card(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ItemDetail(dataList[val], true)));
                      },
                      child: Image(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: NetworkImage(list[val].img),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            list[val].name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
//                      Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text(
//                            "Reward",
//                            style: TextStyle(
//                                color: Colors.black,
//                                fontSize: 12,
//                                fontWeight: FontWeight.w500),
//                          ),
//                          Text(
//                            "₹ ${list[val].reward}",
//                            style: TextStyle(
//                                color: Colors.black,
//                                fontSize: 14,
//                                fontWeight: FontWeight.w500),
//                          ),
//                        ],
//                      ),
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: (fav) ? Colors.red : Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                fav = !fav;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Text(
                            list[val].location,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          list[val].status,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 6, left: 6),
                      child: Text(
                        'Time',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share(
                          'Lost $widget.name at $widget.location, ImageUrl: $widget.img, if Found call: 8837342435');
                    },
                    child: Container(
//                      decoration: BoxDecoration(
//                        color: Colors.grey.withAlpha(100),
//                        borderRadius: BorderRadius.all(Radius.circular(8)),
//                      ),
                      color: Colors.grey.withAlpha(100),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.share,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                'Share',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
//                SizedBox(
//                  height: 5,
//                ),
//                GestureDetector(
//                  onTap: () {
//                    deleteData(list[val].docId);
//                  },
//                  child: Container(
//                    decoration: BoxDecoration(
//                      color: Colors.grey.withAlpha(100),
//                      borderRadius: BorderRadius.all(Radius.circular(8)),
//                    ),
//                    child: Padding(
//                      padding: const EdgeInsets.all(2.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Icon(
//                            Icons.delete,
//                            color: Colors.black,
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.only(left: 6),
//                            child: Text(
//                              'Delete',
//                              style:
//                                  TextStyle(color: Colors.black, fontSize: 16),
//                            ),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//                SizedBox(
//                  height: 5,
//                ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void deleteData(String docId) async {
    await firestore.collection("adds").document(docId).delete();
    setState(() {
      list.clear();
      dataList.clear();
      print(docId);
      loadData();
    });
  }
}

class MyAds {
  final img, name, location, status, reward, docId;

  MyAds(
      {this.img,
      this.name,
      this.location,
      this.status,
      this.reward,
      this.docId});
}
