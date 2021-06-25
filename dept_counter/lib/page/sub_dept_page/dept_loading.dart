import 'dart:convert';

import 'package:dept_counter/page/sub_dept_page/dept_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeptLoading extends StatefulWidget {
  final Map<String, dynamic> userData;
  DeptLoading(this.userData);

  @override
  _DeptLoadingState createState() => _DeptLoadingState();
}

class _DeptLoadingState extends State<DeptLoading> {
  void sendNewDeptDataToServer() async {
    print('Sending');
    print(widget.userData);
    http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:3000/update'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          'username': widget.userData['username']!,
          'deptTopicList': widget.userData['deptTopicList']!,
        },
      ),
    );
    if (response.statusCode == 201) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => DeptPage(widget.userData)));
    }
  }

  @override
  void initState() {
    super.initState();
    sendNewDeptDataToServer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold());
  }
}
