import 'package:dept_counter/page/authen_page/register_add_info_page.dart';
import 'package:flutter/material.dart';

import 'package:dept_counter/page/loading.dart';
import 'package:dept_counter/page/home_page.dart';

import 'package:dept_counter/page/authen_page/login_page.dart';
// import 'package:dept_counter/page/authen_page/login_loading.dart';
import 'package:dept_counter/page/authen_page/register_page.dart';
// import 'package:dept_counter/page/authen_page/register_loading.dart';

import 'package:dept_counter/page/sub_dept_page/dept_page.dart';
import 'package:dept_counter/page/sub_dept_page/dept_add_topic_info_page.dart';
import 'package:dept_counter/page/sub_dept_page/dept_add_time_info_page.dart';

import 'package:dept_counter/page/sub_summary_page/summary_page.dart';

import 'package:dept_counter/page/account/account_setting_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map<String, String> userData = {};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/dept-add-topic-info-page',
      routes: {
        '/': (context) => Loading(),
        '/login': (context) => LoginPage(),
        // '/login-loading': (context) => LoginLoading(),
        '/register': (context) => RegisterPage(),
        // '/register-loading': (context) => RegisterLoading(),
        '/register-add-info': (context) => RegisterAddInfoPage(userData),
        '/home': (context) => Homepage(userData),
        '/dept-page': (context) => DeptPage(),
        '/dept-add-topic-info-page': (context) => DeptAddTopicInfoPage(),
        '/dept-add-time-info-page': (context) => DeptAddTimeInfoPage(),

        '/summary': (context) => SummaryPage(),
        '/account': (context) => AccountSettingPage(),
      },
    );
  }
}
