// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:jsonobj/user_model.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home: HomePage());
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String userJson = '{"id": "1", "fullname": "ammar", "email": "a@gmail.com"}';

//   UserModel userObj = UserModel(
//     id: '1',
//     fullname: 'ammar',
//     email: 'a@gmail.com',
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // serialization
//                   Map<String, dynamic> userMap = userObj.toJson();
//                   var json = jsonEncode(userMap);
//                   print('Serialized JSON:');
//                   print(json);
//                 },
//                 child: Text('Serialize'),
//               ),
//               SizedBox(width: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   var decoded = jsonDecode(userJson);
//                   Map<String, dynamic> userMap = decoded;

//                   // Deserialization: Using fromJson
//                   UserModel newUser = UserModel.fromJson(userMap);
//                   print('Deserialized Object:');
//                   print(newUser); // or any other field like id, email
//                 },
//                 child: Text('De-Serialize'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// // UserModel class
// class UserModel {
//   final String id;
//   final String fullname;
//   final String email;

//   UserModel({required this.id, required this.fullname, required this.email});

//   // Map -> Object
//   //use fromJson
//   // Factory constructor to create a UserModel from a JSON/map object

//   factory UserModel.fromJson(Map<String, dynamic> map) {
//     return UserModel(
//       id: map['id'],
//       fullname: map['fullname'],
//       email: map['email'],
//     );
//   }

//   // Object -> Map
//   //use toJson

//   Map<String, dynamic> toJson() {
//     return {'id': id, 'fullname': fullname, 'email': email};
//   }
// }
//   //Obj - map - json (encode)  serialization

//   //json - map - obj (decode) deserialization
