import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:search_india/chat.dart';
import 'package:search_india/first_screen.dart';
import 'package:search_india/user_display.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dataModel.dart';

class ItemDetail extends StatefulWidget {
  final DataModel data;
  final bool val;

  ItemDetail(this.data, this.val);

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  final _auth = FirebaseAuth.instance;
  bool wait = false;
  ScrollController _controller;
  int currentImg = 0;
  var swipeControl = SwiperController();
   List tags;

  @override
  void initState() {

    _controller = ScrollController();
    super.initState();
    tags= widget.data.tags.split(",");

  }
  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            child: Icon(Icons.share,color: Colors.white,),
            onPressed: (){
              Share.share(
                  'Lost ${widget.data.name} at ${widget.data.location}, ImageUrl: ${widget.data.images[0]}, if Found call: ${widget.data.phone}');
            },
          )
        ],
        backgroundColor: Colors.black,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: (){
          Navigator.pop(context);
        }),
        title: Text(
          "Item Details",
          style: TextStyle(color: Colors.white),
        ),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.message),
//            onPressed: () async {
//              if (widget.val) {
//                var docs =
//                    await Firestore.instance.collection('users').getDocuments();
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => UserDisplay(docs)));
//              } else
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) => Chat(widget.data.uid, false)));
//            },
//          ),
//          !(widget.val)
//              ? IconButton(
//                  icon: Icon(Icons.phone),
//                  onPressed: () async {
//                    String url = 'tel:' + widget.data.phone;
//                    if (await canLaunch(url)) {
//                      await launch(url);
//                    } else {
//                      throw 'Could not launch $url';
//                    }
//                  },
//                )
//              : Container(),
//        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  color: Colors.grey.shade200,
                  height: 580,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Swiper(
                      curve: Curves.linear,
                      controller: swipeControl,
                      loop: false,
                      onIndexChanged: (index) {
                        setState(() {
                          if (!wait) {
                            currentImg = index;
                          }
                        });
                      },
                      containerWidth: MediaQuery.of(context).size.width,
                      itemBuilder: (BuildContext context, int index) {
                        return Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            child: Image.network(
                              widget.data.images[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                      itemCount: widget.data.images.length,
                      viewportFraction: .97,
                      scale: .8,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 90,
                  child: ListView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.data.images.length,
                      itemBuilder: (_, int i) {
                        return InkWell(
                          onTap: () {
                            wait = true;
                            Timer(Duration(milliseconds: 300), () {
                              wait = false;
                            });
                            setState(() {
                              swipeControl.move(
                                i,
                              );
                              currentImg = i;
                            });
                          },
                          child: Container(
                            width: 90,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                border: Border.all(
                                    width: 1.2,
                                    color: currentImg == i
                                        ? Colors.green.shade700
                                        : Colors.black12)),
                            height: 90,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  widget.data.images[i],
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          widget.data.name,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                        ),

                        Text(widget.data.location,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.orange.shade700,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 2, 8, 2),
                            child: Text(
                              widget.data.status,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(widget.data.desc,
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey.shade900)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Reward",
                            style: TextStyle(
                                fontSize: 14, color: Colors.green.shade700)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("₹ ${widget.data.reward}",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red.shade700,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("Tags:",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    )),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Tags(
                          key: _tagStateKey,
                          itemCount: tags.length-1,
                          itemBuilder: (int index){
                            final item= tags[index];
                            return ItemTags(
                              key:Key(index.toString()),
                              index: index,
                              title: item,
                              textStyle: TextStyle(fontSize: 20),

                            );
                          },
                        ),

                        SizedBox(
                          height: 60,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (widget.val) {
                              var docs = await Firestore.instance
                                  .collection('users')
                                  .getDocuments();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserDisplay(docs)));
                            } else
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Chat(widget.data.uid, false)));
                          },
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                            child: Center(
                              child: Text(
                                'SEND MESSAGE',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () async {
                            String url = 'tel:' + widget.data.phone;
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Container(
                            width: 200,
                            height: 40,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                'CALL NOW',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


}