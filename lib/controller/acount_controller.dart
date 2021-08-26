import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketapp/FireBase/FirebaseApi.dart';
import 'package:ticketapp/Models/acount.dart';
import 'package:ticketapp/http/request.dart';

class AcountController extends GetxController{
  late TextEditingController ten;
  late TextEditingController sdt;
  late TextEditingController cmnd;
  late TextEditingController diaChi;
  late TextEditingController ngaySinh;
  late TextEditingController imageUrl;
  var loadStatus=false.obs;
  //File?file;
  var files=File("").obs;
  UploadTask?task;
  
  @override
  void onInit() {
    print("1");

    // TODO: implement onInit
    ten=TextEditingController();
    sdt=TextEditingController();
    cmnd=TextEditingController();
    diaChi=TextEditingController();
    ngaySinh=TextEditingController();
    imageUrl=TextEditingController();
    setInfo();
    super.onInit();
  }
  void setInfo()async{
    print("2");
    SharedPreferences prefs= await SharedPreferences.getInstance();
    ten.text=prefs.getString("Ten")??"";
    sdt.text=prefs.getString("sdt")??"";
    cmnd.text=prefs.getString("CMND")??"";
    diaChi.text=prefs.getString("DiaChi")??"";
    ngaySinh.text=prefs.getString("NgaySinh")??"";
    imageUrl.text=prefs.getString("imageUrl")??"https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png";
    loadStatus.value=true;
  }

  Future selectFile()async{
    final result=await FilePicker.platform.pickFiles(allowMultiple: false);
    if(result==null) return;
    final path=result.files.single.path;

    this.files.value=File(path??"");
    print("Path: ${files.value.path}");

  }

  Future upLoadFile()async{
    if(files.value.path=="")return;
    final fileName=basename(files.value.path);
    task=FilebaseApi.uploadFile("file/$fileName",files.value);
    if(task==null)return;
    final snapshot=await task!.whenComplete((){});
    final urlDownload=await snapshot.ref.getDownloadURL();
    print(urlDownload);

  }

  apiUpdateInfo()async{
    upLoadFile();
    Get.dialog(Center(child: CircularProgressIndicator()));
    SharedPreferences prefs= await SharedPreferences.getInstance();
    var headers = {"Content-type": "application/json"};
    Request request=Request(Url: "https://qlbvxk.herokuapp.com/api/customers/${prefs.getInt("MaND")}",header: headers,body:jsonEncode({
      "TenNd" : ten.text,
      "Sdt" : sdt.text,
      "Cmnd" : cmnd.text,
      "DiaChi" : diaChi.text,
      "NgaySinh" : ngaySinh.text ,
      "imageUrl":"https://scontent-hkt1-1.xx.fbcdn.net/v/t1.6435-9/83034190_800149520461307_2927773317559484416_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=174925&_nc_ohc=5mT9Q0WctsUAX9UP7dZ&_nc_ht=scontent-hkt1-1.xx&oh=feca04032e8d3965d7df8c507965b0ab&oe=6148AED2"
    }));
    request.put().then((value){
      if(value.statusCode==204){
        GetInfoUpdate(prefs);
        print("Cập nhập thông tin thành công !");
      }
    }).catchError((onError){
      print("Lỗi cập nhập thông tin: $onError");
      Get.back();
    });
  }

 GetInfoUpdate(SharedPreferences prefs)async{
   var headers = {"Content-type": "application/json"};
   Request request=Request(Url: "https://qlbvxk.herokuapp.com/api/customers/${prefs.getInt("MaND")}",header: headers,);
   request.get().then((value){
     if(value.statusCode==200){
       acount user=acount.fromJson(json.decode(value.body));
       prefs.setInt("MaND", user.maNd);
       prefs.setString("Ten", user.tenNd);
       prefs.setString("sdt", user.sdt);
       prefs.setString("NgaySinh", user.ngaySinh.substring(0,10));
       prefs.setString("DiaChi", user.diaChi);
       prefs.setString("CMND", user.cmnd);
       prefs.setString("imageUrl", user.imageUrl);
       print("Lấy thông tin thành công !");
       Get.back();
       Get.back();
     }
   }).catchError((onError){
     print("Lỗi load lại thông tin: $onError");
   });
 }

}

