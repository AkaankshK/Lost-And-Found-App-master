import 'package:flutter/material.dart';

class Winner extends StatelessWidget {
  Winner({Key key,this.name,this.desc,this.img}):super(key:key);
  final String name;
  final String desc;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 10,
              child: CircleAvatar(
                  backgroundImage: NetworkImage(img),
              )
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text(name,style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,fontWeight: FontWeight.w600
                    ),),
                    SizedBox(
                      height:3,
                    ),
//                    RichText(
//                      text: TextSpan(
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 14,
//                          ),
//                          children: [
//                            TextSpan(text: 'NavSari Found\n'),
//                            TextSpan(text: 'Documents'),
//                          ]),
//                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Text(desc,style: TextStyle(color: Colors.white,fontSize: 14),),
                  ),
                  ],

                )),
          ),
        ],
      ),
    );
  }
}
