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
