// import 'package:flutter/material.dart';

// class BottomNavigationWidget extends StatelessWidget {
//   const BottomNavigationWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: BorderDirectional(top: BorderSide(width: 1.2,color: data.isDark ? const Color(0xff3f444c) : whiteColor)),
//       ),
//       child: BottomNavigationBar(
//         currentIndex: data.getIndex,
//         type: BottomNavigationBarType.fixed,
//         showUnselectedLabels: true,
//         onTap: (value) {
//           data.showScreen(value);
//         },
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Iconsax.bag_2),
//               label: 'Business'
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Iconsax.cup),
//               label: 'Sports'
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Iconsax.award),
//               label: 'Science'
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Iconsax.setting),
//               label: 'Setting'
//           ),
//         ],
//       ),
//     );
//   }
// }