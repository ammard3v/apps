// import 'dart:ui';

// import 'package:flutter/material.dart';
// // import 'package:jsonobj/home.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: Back());
//   }
// }

// class Back extends StatefulWidget {
//   const Back({super.key});

//   @override
//   State<Back> createState() => _BackState();
// }

// void showAlertDialog(BuildContext context) {
//   showDialog(
//     barrierColor: Colors.pink.withValues(alpha: 0.9),
//     context: context,
//     builder: (BuildContext context) {
//       return BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//         child: AlertDialog(
//           title: Text('HEY'),
//           content: Text('this o s c'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('ok)'),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// class _BackState extends State<Back> {
//   List names = ['amm', 'eaa', 'faaa3rr'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: RefreshIndicator(
//         onRefresh: () async {
//           setState(() {
//             names.add('aa');
//           });
//         },
//         child: ListView.builder(
//           itemCount: names.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               leading: CircleAvatar(
//                 child: Text(names[index].toString().split(' ')[0][0]),
//               ),
//               title: Text(names[index]),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
