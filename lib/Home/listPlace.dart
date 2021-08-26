import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/Home_controller.dart';
import 'package:ticketapp/Controller/ListPlaceController.dart';
import 'package:ticketapp/Theme/colors.dart';

class ListPlace extends GetView<ListPlaceController>{
  ListPlaceController listPlaceController=Get.put(ListPlaceController());
  HomeController homeController=Get.find();
  late String title;

  ListPlace(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 35,color: AppColors.background),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Row(


              children: <Widget>[
              InkWell(child: Icon(Icons.arrow_back,size: 22),onTap: (){
                Get.back();
              }),
              SizedBox(width: 100),
              Text(title, style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w700 )),

            ],),
          ),
          Container(color: Colors.black12,height: 1,),
          Container(child: TextField(
            controller: listPlaceController.place,
            textCapitalization: TextCapitalization.words,
            cursorHeight: 25,
            style: TextStyle(color: Color(0xff494949),fontSize: 25,fontWeight: FontWeight.w800),
            decoration: InputDecoration(prefixIcon: Icon(Icons.album,size: 20,color: AppColors.background,),border: InputBorder.none),
          )),
          Container(
            height: 10,
            color: Color(0xfff2f2f2),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Địa danh phổ biến",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff8c8c8c)),),

          ),
          SizedBox(height: 20),
          buildExpanded(),
        ],
      ),
    );
  }

  Expanded buildExpanded() {
    return Expanded(child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: Obx(()=>listPlaceController.listPalce.length==0?Center(child: CircularProgressIndicator()):ListView.builder(
              itemCount: listPlaceController.listPalce.value.length,
              itemBuilder: (context, index){
                return Container(
                  child: InkWell(child: Column(
                    children:<Widget> [
                      Row(children: <Widget>[
                        Icon(Icons.location_on_outlined,size: 25,color: Color(0xffadadad),),
                        SizedBox(width: 20),
                        Text(title=="Nơi xuất phát"?listPlaceController.listPalce[index].tenBxDi:listPlaceController.listPalce[index].tenBxDen,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xff686868)),)
                      ],),
                      SizedBox(height: 15),
                      Container(color: Colors.black12,height: 1),
                      SizedBox(height: 15),
                    ],
                  ),onTap: (){

                    title=="Nơi xuất phát"?homeController.noidi.text=listPlaceController.listPalce[index].tenBxDi:homeController.noiden.text=listPlaceController.listPalce[index].tenBxDen;

                    title=="Nơi xuất phát"?homeController.tpDi=listPlaceController.listPalce[index].diaChiBxDi:homeController.tpDen=listPlaceController.listPalce[index].diaChiBxDen;

                    print(homeController.tpDi);
                    Get.back();
                  },),
                );

              })),
        ));
  }

}