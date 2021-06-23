import 'package:dept_counter/page/authen_page/register_loading.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
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
                username = value;
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Password';
                }
                password = value;
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm Password';
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
                if (password == confirmPassword) {
                  print('OK');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterLoading(username, password),
                    ),
                  );
                } else {
                  print('Not same');
                }
              }
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
