// import 'dart:convert';

// import 'package:apitut/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// //Login ->later changed to login

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   void login(String email, password) async {
//     try {
//       Response response =
//           await post(Uri.parse('https://reqres.in/api/login'), headers: {
//         'x-api-key': 'reqres-free-v1',
//       }, body: {
//         'email': email,
//         'password': password,
//       });
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body.toString());
//         print(data);
//         print('acccout login sucess');
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (ctx) => SignUp()));
//       } else {
//         print('erroe not crear');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login Up')),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(hintText: 'Email'),
//             ),
//             TextFormField(
//               controller: passwordController,
//               decoration: InputDecoration(hintText: 'Password'),
//             ),
//             const SizedBox(height: 30),
//             GestureDetector(
//               onTap: () {
//                 login(emailController.text.toString(),
//                     passwordController.text.toString());
//               },
//               child: Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                       color: Colors.amber,
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Center(
//                     child: Text('Login'),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
