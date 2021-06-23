import 'package:dept_counter/page/authen_page/register_loading.dart';
import 'package:flutter/material.dart';

class RegisterAddInfoPage extends StatefulWidget {
  final Map<String, String> userRegisterData;

  RegisterAddInfoPage(this.userRegisterData);

  @override
  _RegisterAddInfoPageState createState() => _RegisterAddInfoPageState();
}

class _RegisterAddInfoPageState extends State<RegisterAddInfoPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Info'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
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
                      return 'Please enter your Name';
                    }
                    widget.userRegisterData['name'] = value;
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RegisterLoading(widget.userRegisterData),
                      ),
                    );
                  } else {
                    print('Name invalid');
                  }
                },
                child: Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
