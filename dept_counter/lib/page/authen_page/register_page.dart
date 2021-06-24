import 'package:dept_counter/page/authen_page/register_add_info_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Column(
        children: <Widget>[
          RegisterForm(),
        ],
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final Map<String, String> userRegisterData = {
    'username': '',
    'password': '',
    'name': '',
  };

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Username';
                }
                widget.userRegisterData['username'] = value;
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              controller: _password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Password';
                }
                // else if (!samePassword) {
                //   return 'Password not match';
                // }
                widget.userRegisterData['password'] = value;
                return null;
              },
              obscureText: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              controller: _confirmPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm Password';
                } else if (value != _password.text) {
                  return 'Password not match';
                }
                confirmPassword = value;
                return null;
              },
              obscureText: true,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RegisterAddInfoPage(widget.userRegisterData),
                  ),
                );
                // Navigator.pushReplacementNamed(context, '/register-add-info',);
              }
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
