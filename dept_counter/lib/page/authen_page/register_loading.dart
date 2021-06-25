import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:dept_counter/page/home_page.dart';

class RegisterLoading extends StatefulWidget {
  final Map<String, dynamic> userRegisterData;

  RegisterLoading(this.userRegisterData);

  final Map<String, dynamic> userData = {
    'username': '',
    'name': '',
    'deptTopicList': []
  };

  @override
  _RegisterLoadingState createState() => _RegisterLoadingState();
}

class _RegisterLoadingState extends State<RegisterLoading>
    with TickerProviderStateMixin {
  // late AnimationController controller;

  // @override
  // void initState() {
  //   controller = AnimationController(
  //     vsync: this,
  //     duration: const Duration(seconds: 5),
  //   )..addListener(() {
  //       setState(() {});
  //     });
  //   controller.repeat(reverse: false);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Center(
  //         child: CircularProgressIndicator(
  //           value: controller.value,
  //           // semanticsLabel: 'Linear progress indicator',
  //         ),
  //       ),
  //     ),
  //   );
  // }
  void register() async {
    http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:3000/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'username': widget.userRegisterData['username']!,
          'password': widget.userRegisterData['password']!,
          'name': widget.userRegisterData['name']!,
          'deptTopicList': []
        },
      ),
    );
    if (response.statusCode == 201) {
      widget.userData['username'] = widget.userRegisterData['username']!;

      widget.userData['name'] = widget.userRegisterData['name']!;

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Homepage(widget.userData)));
    } else {
      Navigator.pushReplacementNamed(context, '/register');
    }
  }

  @override
  void initState() {
    super.initState();
    register();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Text('Registering')));
  }
}
