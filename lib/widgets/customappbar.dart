
// import 'package:flutter/material.dart';

// class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppbar({
//     super.key, required this.title,
//   });
// final String title;
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       elevation: 0,
//       centerTitle: true,
//       title: Text(title,style: TextStyle(fontSize: 20),),
//       leading: CircleAvatar(
//           radius: 30,
//           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//           foregroundColor:Theme.of(context).appBarTheme.foregroundColor,
//           child: IconButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               icon: Icon(
//                 Icons.arrow_back_ios,
//                 size: 30,
//                 color: Theme.of(context).appBarTheme.iconTheme!.color
//                 ,
//               ))),
//     );
//   }
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);


// }
