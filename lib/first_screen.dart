import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:search_india/itemDetail.dart';
import 'package:share/share.dart';
import 'winner.dart';
import 'dataModel.dart';
import 'login_page.dart';

class FirstScreen extends StatefulWidget {
  final bool dir;

  FirstScreen(this.dir);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String imgage, category, status, city, uid1;
  List<DataModel> dataList = List();
  final firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedinuser;
  bool loading = false;
  bool heroLoading=true;
  List<CardView> list = <CardView>[];
  List<heroesOfTheMonth> heroList=List();
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
      print("dataloaded");
      if (widget.dir) {
        for (var doc in data.documents) {
          if (doc.data['uid'] == uid1) {
            list.add(
              CardView(
                name: doc.data['category'],
                location: doc.data['city'],
                status: doc.data['posttype'],
                img: doc.data['uri'][0],
                reward: doc.data['reward'],
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
                  doc.data['subcategory'],
                  doc.data['additionalinfo'],
                  doc.data['adID']
              ),
            );
          }
          print("dataloaded1");
          setState(() {
            loading = false;
          });
        }
      } else {
        for (var doc in data.documents) {
          list.add(
            CardView(
              name: doc.data['category'],
              location: doc.data['city'],
              status: doc.data['posttype'],
              img: doc.data['uri'][0],
              reward: doc.data['reward'],
              phone: doc.data['phone'],
              additionalinfo: doc.data['additionalinfo'],
              adID: doc.data['adID'],
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
                doc.data['subcategory'],
                doc.data['additionalinfo'],
                doc.data['adID']
            ),
          );
          setState(() {
            loading = false;
          });
        }
      }
//

    } catch (e) {
      print(e);
    }

  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    loadData();
    heroData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight * 2) / 2;
    final double itemWidth = size.width / 2;

    return ModalProgressHUD(
      inAsyncCall: loading,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: itemWidth / itemHeight,
              ),
              itemBuilder: (context, val) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ItemDetail(dataList[val], false),
                        ),
                      );
                    },
                    child: list[val]);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Heroes of the month',
              style: TextStyle(fontSize: 24),
            ),
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: 4,
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, i) {
                  if(heroLoading){
                    return Center(child: CircularProgressIndicator());
                  }
                  var data=heroList[i];
                  return Winner(name: data.name,desc: data.desc,img: data.img);
                }),
            SizedBox(height: 20,),
            Text(
              'Success Stories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.blue, Colors.purple]),
                  ),
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  height: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          "Good Try! This Page is Helping"
                          " People to handle the "
                          "Lost And Found Things Easily.",
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                      Text("----------------------------",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                      Text("Nehul Neha",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      Text("Mumbai",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void heroData() async{
    var heroesOfMonth=await
          Firestore.instance.collection('heroesOfMonth')
          .getDocuments();
      for(var doc in heroesOfMonth.documents){
        heroList.add(heroesOfTheMonth(
         name: doc.data['name'],
          desc: doc.data['desc'],
          img: doc.data['img']
        ));
      }
      setState(() {
        heroLoading=false;
      });
  }
}

class heroesOfTheMonth{
  String  name;
  String desc;
  String img;
  heroesOfTheMonth({this.name,this.desc,this.img});
}

class CardView extends StatelessWidget {
  final img, name, location, status, reward, docId, desc,phone,additionalinfo,adID;

  CardView(
      {this.img,
      this.name,
      this.location,
      this.status,
      this.reward,
      this.docId,
      this.desc,
        this.phone,
        this.additionalinfo,
        this.adID
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(img),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Reward",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "₹ $reward",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                Expanded(
                  child: Text(
                    location,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  status,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Icon(Icons.access_time),
                ),
                Text(" "+DateTime.parse(additionalinfo['date']).difference(DateTime.now()).inDays.abs().toString()),
                Text(" Days Ago"),
              ],
            ),
            GestureDetector(
              onTap: () {
                Share.share(
                    'Lost/Found $name at $location, adURL: https://cwservices.co.in/globalsearch/item.php?id=$adID , if Lost/Found call: $phone');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
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
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
