import 'package:apitut/main.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  void _attemptLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Normally here you'd do authentication logic
      Navigator.pushReplacementNamed(context, MyApp.dashboardRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Username'),
                  onSaved: (value) => _username = value ?? '',
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter username'
                      : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onSaved: (value) => _password = value ?? '',
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter password'
                      : null,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _attemptLogin,
                  child: Text('Login'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyApp.passwordResetRoute);
                  },
                  child: Text('Forgot Password?'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
