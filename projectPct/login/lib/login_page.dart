import 'package:flutter/material.dart';
import 'package:login/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  var enteredUsername = '';
  var enteredPassword = '';

  void goToHome() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(enteredUsername);
      print(enteredPassword);
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(label: Text('Username')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username cant be empty';
                  }
                  return null;
                },

                onSaved: (value) {
                  enteredUsername = value!;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(label: Text('Password')),
                obscureText: true,
                validator: (value) {
                  if (value == null) {
                    return 'Password cant be empty';
                  } else if (value.length < 8) {
                    return 'Pasword shouldnt be les then 8';
                  }
                  return null;
                },
                onSaved: (value) {
                  enteredPassword = value!;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: goToHome, child: Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}
