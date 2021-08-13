import 'package:flutter/cupertino.dart';

class ChairObj{
 late String name;
  late int id;
 late bool tinhtrang;
 late Color colorChair;
  ChairObj(this.id,this.name,this.tinhtrang,this.colorChair);
 ChairObj.fromJson(Map<String, dynamic> json) {
  id = json['maChoNgoi'];
  tinhtrang = json['tinhTrangChoNgoi'];
 }

 Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['maChoNgoi'] = this.id;
  data['tinhTrangChoNgoi'] = this.tinhtrang;
  return data;
 }
}