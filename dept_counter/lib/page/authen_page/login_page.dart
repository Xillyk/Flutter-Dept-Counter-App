import 'package:flutter/material.dart';
import 'package:dept_counter/page/home_page.dart';
import 'package:dept_counter/page/authen_page/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          height: 592.0,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                LoginForm(),
                Row(
                  children: <Widget>[
                    Text("Don't have account?"),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      ),
                      child: Center(
                        child: Text('Register'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  // void _toggleHideOrShowPassword() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 25.0, 20.0, 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                icon: const Padding(
                  padding: const EdgeInsets.only(left: 1.0),
                  child: const Icon(Icons.account_circle_rounded),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Username';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 25.0),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                icon: const Padding(
                  padding: const EdgeInsets.only(left: 1.0),
                  child: const Icon(Icons.lock),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Password';
                }
                return null;
              },
              obscureText: _obscureText,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('OK');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homepage(),
                  ),
                );
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
