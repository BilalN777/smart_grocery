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
        print('Username: $_username, \nPassword: $_password');
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
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Smart Grocery'),
          bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.account_circle_rounded),
            ),
            Tab(
              icon: Icon(Icons.account_box_rounded),
            )
          ]),
        ),
        body: TabBarView(
          children:<Widget>[
            Padding(
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
                      TextButton(
                          onPressed: _guestLogin,
                          child: const Text('Continue as guest'))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
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
                            return 'Please enter name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _username = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(labelText: 'Email'),
                      ),
                      const SizedBox(height: 16),
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
                        decoration: const InputDecoration(labelText: 'Username'),
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
                        decoration: const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _username = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter  dietary restrictions and allergies.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Dietary restrictions and allergies.'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loginUser,
                        child: const Text('Sign up'),
                      ),
                     ],
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }


}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

