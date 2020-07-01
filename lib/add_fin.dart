import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart'as http;
//import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class FinalAdd extends StatefulWidget {
  final Map<String, dynamic> map;

  FinalAdd({this.map});

  @override
  _FinalAddState createState() => _FinalAddState();
}

class _FinalAddState extends State<FinalAdd> {
  final scaffoldKey=GlobalKey<ScaffoldState>();
  final pdf = pw.Document();
  List<Asset> images = List<Asset>();
  final _auth = FirebaseAuth.instance;
  String _error = 'No Error Dectected';
  final _firestore = Firestore.instance;
  FirebaseUser loggedinuser;
  bool loading = false;
  List<File> _images = [];
  String location, uid1;
  var uris = [];
   String pdfURL;
//   PdfColor grey = PdfColor.fromInt(0xffe2e2e2);
//  PdfColor black = PdfColor.fromInt(0xff000000);
//  PdfColor white = PdfColor.fromInt(0xffffffff);
//   PdfColor lightGreen = PdfColor.fromInt(0xffffff00);
  void getCurrentUser() async {
    try {
      setState(() {
        loading = true;
      });
      var user = await _auth.currentUser();
      if (user != null) {
        loggedinuser = user;
        uid1 = loggedinuser.uid;
      }
      setState(() {
        loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List<String>> uploadImage({@required List<Asset> assets}) async {
    List<String> uploadUrls = [];

    await Future.wait(
        assets.map((Asset asset) async {
          ByteData byteData = await asset.getByteData();
          List<int> imageData = byteData.buffer.asUint8List();
          StorageReference reference = FirebaseStorage.instance.ref().child(
              "pics/" + DateTime.now().millisecondsSinceEpoch.toString());
          StorageUploadTask uploadTask = reference.putData(imageData);
          StorageTaskSnapshot storageTaskSnapshot;
          StorageTaskSnapshot snapshot = await uploadTask.onComplete;
          if (snapshot.error == null) {
            storageTaskSnapshot = snapshot;
            final String downloadUrl =
                await storageTaskSnapshot.ref.getDownloadURL();
            uploadUrls.add(downloadUrl);

            print('Upload success');
          } else {
            print('Error from image repo ${snapshot.error.toString()}');
            throw ('This file is not an image');
          }
        }),
        eagerError: true,
        cleanUp: (_) {
          print('eager cleaned up');
        });

    return uploadUrls;
  }

  Widget buildGridView() {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AssetThumb(
              asset: asset,
              width: 300,
              height: 300,
            ),
          ),
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(

        maxImages: 5,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          statusBarColor: "#191919",
          actionBarColor: "#212121",
          actionBarTitle: "Upload Image",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#212121",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    images.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Create Report'),
          actions: <Widget>[],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                images.length == 0
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              child: Center(
                                  child: InkWell(
                                onTap: () {
                                  loadAssets();
                                },
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.add,
                                        size: 100,
                                      ),
                                      Text(
                                        'SELECT PICTURES',
                                        style: TextStyle(
                                          fontSize: 30,

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))),
                        ),
                      )
                    : Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                              child: Container(
                                  height: 300, child: buildGridView()),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 12.0, top: 5),
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(
                                        Icons.refresh,
                                        size: 32,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {
                                        loadAssets();
                                      }),
                                  Text("Re-take")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                Container(
                  margin: EdgeInsets.only(bottom: 30, top: 20),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Use real picture, not Catalog.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                           ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                GestureDetector(
                  onTap: () async {
                    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Please wait, Processing Data!"),));
                    setState(() {
                      loading = true;
                    });
                    uris = await uploadImage(assets: images);
                    //ByteData byteData = await images[0].getByteData();
//                    final PdfImage profileImage = PdfImage.file(
//                      pdf.document,
//                      bytes: byteData.buffer.asUint8List(),
//                    );
//                    String pdfLink=await createPdf(profileImage);
                    String adID=DateTime.now().millisecondsSinceEpoch.toString();
                    await _firestore.collection('adds').add({
                      'adID':adID,
                      'uid': uid1,
                      'category': widget.map['category'],
                      'reward': widget.map['reward'],
                      'subcategory': widget.map['subcategory'],
                      'posttype':
                          widget.map['posttype'] == '0' ? 'LOST' : "FOUND",
                      'city': widget.map['city'],
                      'uri': uris,
                      'desc': widget.map['desc'],
                      'phone':(widget.map['phoneval'] == 'false')? widget.map['mobile']:" ",
                      'timestamp':
                          DateTime.now().millisecondsSinceEpoch.toString(),
                        'tags': widget.map['tags'],
                        'additionalinfo':widget.map['additionalinfo'],
                    });
                      postAD(adID);
                    setState(() {
                      loading = true;
                    });
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.black),
                      child: Center(
                        child: Text(
                          'Finish',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//  createPdf(PdfImage image) async{
//    pdf.addPage(pw.Page(
//        pageFormat: PdfPageFormat.a4,
//        build: (pw.Context context) {
//          return pw.Column(
//              crossAxisAlignment: pw.CrossAxisAlignment.start,
//              children: <pw.Widget>[
//                pw.Row(
//                    mainAxisAlignment: pw.MainAxisAlignment.center,
//                    children: <pw.Widget>[
//                      pw.Image(image,height: 300,width: 300)
//                    ]
//                ),
//                pw.SizedBox(height: 5),
//                pw.Row(
//                  children: <pw.Widget>[
//                    pw.Container(padding:pw.EdgeInsets.all(5),color:lightGreen,child: pw.Text(widget.map['posttype'] == '0' ? 'LOST' : "FOUND",style: pw.TextStyle(fontWeight: pw.FontWeight.bold),)),
//                    pw.Padding(
//                      padding: const pw.EdgeInsets.only(left: 5.0),
//                      child: pw.Text(" Date:  "),
//                    ),
//                    pw.Text(widget.map["additionalinfo"]["date"].toString().substring(0,10)+"   - "),
//                    (widget.map['subcategory']!=null)?pw.Text(widget.map["subcategory"]):pw.Container(),
//                  ],
//                ),
//                pw.SizedBox(height: 10),
//                pw.Text(widget.map['additionalinfo']['title'],style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold)),
//                pw.SizedBox(height: 8),
//                InfoCard(field: "Location",data: widget.map['city']),
//                InfoCard(field: "Reward",data: widget.map['reward']),
//                pw.SizedBox(height: 10),
//                pw.Text(widget.map['desc']),
//                pw.SizedBox(height: 5),
//                pw.Container(
//                  color: black,
//                  child: pw.Padding(
//                    padding:  pw.EdgeInsets.all(8),
//                    child: pw.Text(
//                      "Additional Information",
//                      style:
//                      pw.TextStyle(fontSize: 15, color:white),
//                    ),
//                  ),
//                ),
//                (widget.map['additionalinfo'].containsKey("last_location"))?
//                InfoCard(field:"Last Seen Location",data:widget.map['additionalinfo']['last_location']):pw.Container(),
//                (widget.map['additionalinfo'].containsKey("brand"))?
//                InfoCard(field:"Brand",data: widget.map['additionalinfo']['brand'])
//                    :Container(),
//                (widget.map['additionalinfo'].containsKey("color"))?
//                InfoCard(field:"Color", data:widget.map['additionalinfo']['color']):pw.Container(),
//                (widget.map['additionalinfo'].containsKey("serialno"))?
//                InfoCard(field:"Serial Number",data: widget.map['additionalinfo']['serialno']):pw.Container(),
//                (widget.map['additionalinfo'].containsKey("name"))?
//                InfoCard(field:"Name",data: widget.map['additionalinfo']['name']):pw.Container(),
//                (widget.map['additionalinfo'].containsKey("age"))?
//                InfoCard(field:"Age", data:widget.map['additionalinfo']['age'])
//                    :pw.Container(),
//                (widget.map['additionalinfo'].containsKey("imei"))?
//                InfoCard(field:"IMEI",data: widget.map['additionalinfo']['imei']):pw.Container(),
//              ]
//          ); // Center
//        }));
//    final output = await getTemporaryDirectory();
//    final file = File("${output.path}/example.pdf");
//    await file.writeAsBytes(pdf.save());
//    StorageReference reference = FirebaseStorage.instance.ref().child(
//        "pdfs/" + DateTime.now().millisecondsSinceEpoch.toString());
//    StorageUploadTask uploadTask = reference.putFile(file);
//    StorageTaskSnapshot storageTaskSnapshot;
//    StorageTaskSnapshot snapshot = await uploadTask.onComplete;
//    if (snapshot.error == null) {
//      storageTaskSnapshot = snapshot;
//      final String downloadUrl =
//      await storageTaskSnapshot.ref.getDownloadURL();
//      print('Upload PDF uploaded');
//      pdfURL=downloadUrl;
//      print(pdfURL);
//    } else {
//      print('Error from image repo ${snapshot.error.toString()}');
//      throw ('This file is not an image');
//    }
//    return pdfURL;
//  }



  @override
  void dispose() {
    super.dispose();
  }

  void postAD(String adID) async{
    print(uris.runtimeType);
    var data={
      'id':adID,
      'ad_category': widget.map['category'],
      'ad_reward': widget.map['reward'],
      'ad_subcategory': widget.map['subcategory'],
      'ad_type':
      widget.map['posttype'] == '0' ? 'LOST' : "FOUND",
      'ad_city': widget.map['city'],
      'ad_img1': uris,
      'ad_description': widget.map['desc'],
      'reporter_phone':(widget.map['phoneval'] == 'false')? widget.map['mobile']:" ",
      'ad_tags': widget.map['tags'],
      'obj':widget.map['additionalinfo'],
    };
    var body=jsonEncode(data);
    String url="https://cwservices.co.in/globalsearch/api/ads/create.php";
    try {
      var response=await http.post(url,headers:{
        "Content-Type":"application/json"
      },body: body
      );
      print("done");
      print(jsonDecode(response.body));
    } on Exception catch (e) {
      print(e.toString());
    }

  }

}

//class InfoCard extends pw.StatelessWidget {
//  InfoCard({this.field,this.data});
//  final String field;
//  final String data;
//  @override
//  pw.Widget build(pw.Context context) {
//    PdfColor grey = PdfColor.fromInt(0xffe2e2e2);
//    PdfColor lightGreen = PdfColor.fromInt(0xffcdf1e7);
//    return pw.Column(
//      children: <pw.Widget>[
//        pw.Container(
//          height: 30,
//          color: grey,
//          child: pw.Row(
//            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//            children: [
//              pw.Padding(
//                padding:  pw.EdgeInsets.only(left: 10.0),
//                child: pw.Text(field,style: pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold),),
//              ),
//              pw.Padding(
//                padding: pw.EdgeInsets.only(right:10.0),
//                child: pw.Text(data,style: pw.TextStyle(fontSize: 12),),
//              ),
//            ],
//          ),
//        )
//      ],
//    );
//  }
//}

