import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/Account/account.dart';
import 'package:ticketapp/Controller/controller_theme.dart';
import 'package:ticketapp/Myticket/myticket.dart';
import 'package:ticketapp/Notify/notify.dart';
import 'package:ticketapp/Theme/colors.dart';

import 'homePage.dart';


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      AppColors.background= AppColors.background;
    });
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(

          items: const<BottomNavigationBarItem>[

          BottomNavigationBarItem(
              icon: Icon(Icons.search),
           //  activeIcon:Icon(Icons.search),
              label: 'Tìm vé',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(Icons.my_library_add),
         //   activeIcon:Icon(Icons.my_library_add,),
            label: 'Vé của tôi',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.campaign),
          //  activeIcon:Icon(Icons.campaign,),
            label: 'Thông báo',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person),
          //  activeIcon:Icon(Icons.person,),
            label: 'Tài khoản',
          ),
          ],
          activeColor: AppColors.background,
        ), tabBuilder: (context, index) {
          switch(index){
            case 0: return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: HomePage(),);
              },);
            case 1: return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child:Myticket());
              },);
            case 2: return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: Notify());
              },);
            default: return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: Account(),);
              },);
          }
        },
    );
  }
}


//
// import 'package:flutter/material.dart';
// import 'package:ticketapp/Account/account.dart';
// import 'package:ticketapp/Home/HomePage.dart';
// import 'package:ticketapp/Myticket/myticket.dart';
// import 'package:ticketapp/Notify/notify.dart';
// import 'package:ticketapp/Theme/colors.dart';
//
//
// class bottomNav extends StatefulWidget {
//   @override
//   _bottomNavState createState() => _bottomNavState();
// }
//
// class _bottomNavState extends State<bottomNav> {
//   int _pageIndex = 0;
//
//   late PageController _pageController;
//
//   List<Widget> tabPages = [
//     HomePage(),
//     Myticket(),
//     Notify(),
//     Account(),
//   ];
//
//   @override
//   void initState(){
//     super.initState();
//     _pageController = PageController(initialPage: _pageIndex);
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _pageIndex,
//         onTap: _ontap,
//         selectedItemColor: AppColors.background,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.black45,),
//               activeIcon:Icon(Icons.search,color: AppColors.background,),
//               label: 'Tìm vé',
//               backgroundColor: Colors.white),
//           BottomNavigationBarItem(icon: Icon(Icons.my_library_add,color: Colors.black45,),
//             activeIcon:Icon(Icons.my_library_add,color: AppColors.background,),
//             label: 'Vé của tôi',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.campaign,color: Colors.black45,),
//             activeIcon:Icon(Icons.campaign,color: AppColors.background,),
//             label: 'Thông báo',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.black45,),
//             activeIcon:Icon(Icons.person,color: AppColors.background,),
//             label: 'Tài khoản',
//           ),
//         ],
//
//       ),
//       body: PageView(
//         children: tabPages,
//         onPageChanged: onPageChanged,
//         controller: _pageController,
//       ),
//     );
//   }
//   void onPageChanged(int page) {
//     setState(() {
//       this._pageIndex = page;
//     });
//   }
//   void _ontap(int index) {
//     this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
//   }
// }
//
//


