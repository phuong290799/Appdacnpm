import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:ticketapp/Account/account.dart';
import 'package:ticketapp/Myticket/myticket.dart';
import 'package:ticketapp/Notify/notify.dart';

import 'homePage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
        ),
      ),
      children: <Widget>[
        HomePage(),
        Myticket(),
        Notify(),
        Account(),
      ],

      onItemTap: (index) {},
    );
  }

  final _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home2')),
    BottomNavigationBarItem(icon: Icon(Icons.event), title: Text('events')),
    BottomNavigationBarItem(
        icon: Icon(Icons.save_alt), title: Text('downloads')),
  ];
}
