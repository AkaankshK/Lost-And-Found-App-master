import 'package:flutter/material.dart';

class DataModel extends StatelessWidget {
  final String name;
  final String location;
  final String status;
  final List images;
  final String reward;
  final String desc;
  final String uid;
  final String phone;
  final String tags;
  final String subcategory;
  final Map<String,dynamic> additionalinfo;
  final String pdfLink;


  DataModel(this.name, this.location, this.status, this.images, this.reward, this.desc, this.uid, this.phone,this.tags,this.subcategory,this.additionalinfo,this.pdfLink);

  @override
  Widget build(BuildContext context) {
    return null;
  }}