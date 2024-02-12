// import 'package:flutter/material.dart';

// class BottomNavigationBarWidget extends StatelessWidget {
//   final int currentPage;
//   final ValueChanged<int> onDestinationSelected;

//   const BottomNavigationBarWidget({
//     Key? key,
//     required this.currentPage,
//     required this.onDestinationSelected,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return NavigationBar(
//         destinations: const [
//           NavigationDestination(icon: Icon(Icons.home), label: "home"),
//           NavigationDestination(icon: Icon(Icons.location_on_outlined), label: "location"),
//           NavigationDestination(icon: Icon(Icons.groups), label: "community"),
//           NavigationDestination(icon: Icon(Icons.person_2_outlined), label: "profile")
//         ],
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentPage = index;
//           });
//         },
//         selectedIndex: currentPage,
//       ),
//   }
// }
