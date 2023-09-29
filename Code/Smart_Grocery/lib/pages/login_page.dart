import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

// void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  void _loginUser() {
    if (_formKey.currentState!.validate()) {
      // Handle login logic here
      if (kDebugMode) {
        print('Username: $_username, Password: $_password');
      }
      // For demonstration purposes, navigate to a new screen on submit
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  void _signupUser() {
    if (_formKey.currentState!.validate()) {
      // Handle login logic here
      if (kDebugMode) {
        print('Username: $_username, Password: $_password');
      }
      // For demonstration purposes, navigate to a new screen on submit
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  void _guestLogin() {
    if (_formKey.currentState!.validate()) {
      // Handle login logic here
      if (kDebugMode) {
        print('Username: $_username, Password: $_password');
      }
      // For demonstration purposes, navigate to a new screen on submit
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left : 50.0 , right: 50) ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _username = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _loginUser,
                  child: const Text('Login'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _signupUser,
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 16),
                TextButton(
                    onPressed: _guestLogin,
                    child: const Text('Continue as guest'))
              ],
            ),
          ),
        ),
      ),
    );
  }


}


