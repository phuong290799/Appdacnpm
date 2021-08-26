import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Controller/review_controller.dart';
import 'package:ticketapp/Models/reviews.dart';


class Review extends GetView<ReviewController> {
  ReviewController reviewController=Get.put(ReviewController());
  late int maNhaXe;

  Review(this.maNhaXe);

  @override
  Widget build(BuildContext context) {

reviewController.apiGetReview(this.maNhaXe);
    // TODO: implement build
    return Scaffold(
      body: Obx(()=>Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          buildAppBar(),
          reviewController.statusLoad==true?builLoadListReview(context):Center(child: CircularProgressIndicator())


        ],
      )),
    );
  }

  Container buildAppBar() {
    return Container(
          //width: MediaQuery.of(context).size.width,
          //color: Colors.amber,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(child:Icon(Icons.arrow_back_sharp,size: 20,),
                  onTap: (){
                    Get.back();
                  },),

                Text(
                  "Đánh Giá",
                  style: TextStyle(color: Color(0xff565656), fontSize: 22,fontWeight: FontWeight.w800),
                ),
                Opacity(opacity: 0.0,
                child: Icon(Icons.arrow_back_sharp,size: 20,),)
              ],),
              SizedBox(height: 30),
              Text(
                "${reviewController.star}",
                style: TextStyle(color: Colors.black, fontSize: 50,fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 10),
              Container(
                //color: Colors.red,
                height: 50,
                width: 150,
                child:ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return Icon(reviewController.star.value>index?Icons.star:Icons.star_border,size: 30,color: reviewController.star.value>index?Colors.amber:Colors.grey,);
                    }),
              ),
              SizedBox(height: 30),






            ],
          ),
        );
  }

  Expanded builLoadListReview(BuildContext context) {
    return Expanded(child: Container(
      child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification:
                      (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return true;
                  },
                  child: ListView.builder(
                    itemCount: reviewController.listReview.length,
                      itemBuilder: (context, index){
                       Reviews reviews=  reviewController.listReview[index];
                      return Column(
                        children: <Widget>[
                          Container(width: MediaQuery.of(context).size.width,
                            height: 0.5,
                            color: Colors.black12,
                          ),
                          itemReview(reviews,context),
                        ],
                      );

                  })),));
  }

  Container itemReview(Reviews reviews, BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            CircleAvatar(
              maxRadius: 22,
              backgroundImage: NetworkImage("${reviews.imageUrl!=""?reviews.imageUrl:"https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"}"),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text("${reviews.tenNd}",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 5),
              Container(
                //color: Colors.red,
                height: 25,
                width: 150,
                child:ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return Icon(reviews.sao>index?Icons.star:Icons.star_border,size: 25,color: reviews.sao>index?Colors.amber:Colors.grey,);
                    }),
              ),
            ],)
          ],),
          SizedBox(height: 10),
          Text("${reviews.noiDungDanhGia}",style: TextStyle(color: Color(0xff6d6d6d),fontSize: 20,fontWeight: FontWeight.w400),),
          SizedBox(height: 5),


        ],
      ),
    );
  }
}
