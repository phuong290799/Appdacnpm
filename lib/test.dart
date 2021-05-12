// import 'package:flutter/material.dart';
//
// import 'LocalizationService.dart';
//
// class Test extends StatefulWidget {
//   @override
//   _TestState createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   String _selectedLang = LocalizationService.locale!.languageCode;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         //title: Text('hello'.tr),
//       ),
//       body: Container(
//         child: Center(
//           child: DropdownButton<String>(
//             icon: Icon(Icons.arrow_drop_down),
//             value: _selectedLang,
//             items: _buildDropdownMenuItems(),
//             onChanged: (value) {
//               setState(() => _selectedLang = value!);
//               LocalizationService.changeLocale(value!);
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
//     var list = <DropdownMenuItem<String>>[];
//     LocalizationService.langs.forEach((key, value) {
//       list.add(DropdownMenuItem<String>(
//         value: key,
//         child: Text(key),
//       ));
//     });
//     return list;
//   }
// }
//
