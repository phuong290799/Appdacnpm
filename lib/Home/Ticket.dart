import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticketapp/widget/MySeparator.dart';

class Ticket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff969696),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildBill(context),
        ],
      ),
    );
  }

  Widget buildBill(BuildContext context) {
    return Container(
        height: 460,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Positioned(
              top: 0,
              left: 24,
              right: 24,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                  ],
                ),
              )),
          Positioned(
              top: 360,
              left: 5,
              right: 5,
              child: Container(
                  child: Row(children: <Widget>[
                    buildContainerRadius(),
                    Expanded(
                        child: const MySeparator(
                            color: Color(0xffBDC4D3))),
                    buildContainerRadius()
                  ]))),
        ]));
  }

  Container buildContainerRadius() {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: Color(0xff969696),
          borderRadius: BorderRadius.all(Radius.circular(100))),
    );
  }
}
