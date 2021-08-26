import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 Future<dynamic> buildShowModalBottomSheet(BuildContext context, TextEditingController editStarReview , TextEditingController textEditingController,Widget widget ) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (context){
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 25,
                width: 25,
                child:
                Image(image: AssetImage("assets/images/bus-icon.png"),),
              ),
              Text(
                "VeXeTot",
                style: TextStyle(fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
          SizedBox(height: 30),
          Text("Đánh giá chuyến đi",style:  TextStyle(fontStyle: FontStyle.italic,
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.w800),),
          SizedBox(height: 20),
          StatefulBuilder(builder: (BuildContext context, StateSetter setState){
            return  Container(
              //color: Colors.red,
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: InkWell(
                        child: Icon(int.parse(editStarReview.text)>index?Icons.star:Icons.star_border,size: 40,color: int.parse(editStarReview.text)>index?Colors.amber:Colors.grey,),
                        onTap: (){
                          print(int.parse(editStarReview.text));
                          print(index);
                          if(index==0){
                            if(int.parse(editStarReview.text)==1){
                              setState((){
                                editStarReview.text=index.toString();
                              });
                            }
                            else{
                              setState((){
                                editStarReview.text=(index+1).toString();
                              });
                            }
                          }
                          else{
                            setState((){
                              editStarReview.text=(index+1).toString();
                            });
                          }

                        },
                      ),);
                  }),);
          },),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            height: 400,
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.black12),
            child: TextField(
              //maxLength: 100,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 4,
              controller: textEditingController,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
              keyboardType: TextInputType.text,

              onTap: () {
                // print(MediaQuery.of(context).viewPadding.bottom);
              },
              cursorHeight: 20,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),),
          SizedBox(height: 20),
          widget,
          //buildButtonSendReview()
        ],
      ),);
  });
}