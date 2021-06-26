import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:dept_counter/page/sub_dept_page/dept_information_page.dart';

class DeptInformationLoading extends StatefulWidget {
  final Map<String, dynamic> userData;
  final deptIndex;
  DeptInformationLoading(this.userData, this.deptIndex);

  @override
  _DeptInformationLoadingState createState() => _DeptInformationLoadingState();
}

class _DeptInformationLoadingState extends State<DeptInformationLoading> {
  void sendDataToServer() async {
    print('Sending');
    print(widget.userData);
    http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:3000/update-paid-dept'),
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
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DeptInformationPage(widget.userData, widget.deptIndex)));
    }
  }

  @override
  void initState() {
    super.initState();
    sendDataToServer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold());
  }
}
