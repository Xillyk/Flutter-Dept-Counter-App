import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginLoading extends StatefulWidget {
  // final String username, password;
  // LoginLoading(this.username, this.password) {
  //   print('$username- $password');
  // }
  final String username;
  final String password;

  LoginLoading(this.username, this.password);

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

  // void register() async {
  //   String username = 'aa';
  //   String password = 'bb';

  //   http.Response response = await http.post(
  //     Uri.parse('http://10.0.2.2:3000/register'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(
  //       <String, String>{
  //         'username': username,
  //         'password': password,
  //       },
  //     ),
  //   );
  // }

  void verifyUser() async {
    http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:3000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'username': widget.username,
          'password': widget.password,
        },
      ),
    );
    if (response.body == 'Success') {
      fetchUserData();
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void fetchUserData() async {
    http.Response response =
        await http.get(Uri.parse('http://10.0.2.2:3000/user'));
    // try {
    //   Map data = jsonDecode(response.body);
    //   print(data);
    // } catch (err) {
    //   print(err);
    // }
    // try {
    //   List data = jsonDecode(response.body);
    //   print(data);
    // } catch (err) {
    //   print(err);
    // }
    print(response.body);
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
