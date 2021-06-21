import 'package:flutter/material.dart';

class AccountSettingPage extends StatelessWidget {
  const AccountSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account Setting')),
      body: AccountSettingForm(),
    );
  }
}

class AccountSettingForm extends StatefulWidget {
  const AccountSettingForm({Key? key}) : super(key: key);

  @override
  _AccountSettingFormState createState() => _AccountSettingFormState();
}

class _AccountSettingFormState extends State<AccountSettingForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          }),
        ],
      ),
    );
  }
}
