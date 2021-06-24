import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dept_counter/page/home_page.dart';

class LoginLoading extends StatefulWidget {
  final Map<String, String> userLoginData;

  LoginLoading(this.userLoginData);

  @override
  _LoginLoadingState createState() => _LoginLoadingState();
}

class _LoginLoadingState extends State<LoginLoading>
    with TickerProviderStateMixin {
  late AnimationController controller;

//   @override
//   void initState() {
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 5),
//     )..addListener(() {
//         setState(() {});
//       });
//     controller.repeat(reverse: false);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: CircularProgressIndicator(
//             value: controller.value,
//             // semanticsLabel: 'Linear progress indicator',
//           ),
//         ),
//       ),
//     );
//   }

  Map<String, dynamic> userData = {};

  void verifyUser() async {
    http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:3000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'username': widget.userLoginData['username']!,
          'password': widget.userLoginData['password']!,
        },
      ),
    );
    if (response.body == 'Success') {
      fetchUserData();
      // Navigator.pushReplacementNamed(context, '/home');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homepage(userData)));
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void fetchUserData() async {
    http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:3000/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'username': widget.userLoginData['username']!,
        },
      ),
    );

    dynamic data;
    try {
      data = jsonDecode(response.body);
      // print(data);
    } catch (err) {
      print(err);
    }

    if (response.statusCode == 200) {
      userData = data[0];
      print(userData);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homepage(userData)));
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }

    // try {
    //   data = jsonDecode(response.body);
    //   print(data[0]['name']);
    //   widget.userData['name'] = data[0]['name'];
    // } catch (err) {
    //   print(err);
    // }
  }

  @override
  void initState() {
    super.initState();
    verifyUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // body: Text('$username - $password'),
          ),
    );
  }
}
