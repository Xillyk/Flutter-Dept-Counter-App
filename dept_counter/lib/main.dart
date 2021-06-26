// @dart=2.9
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
// import 'package:dept_counter/page/sub_dept_page/dept_add_time_info_page.dart';
// import 'package:dept_counter/page/sub_dept_page/dept_create_and_modify_dept_list_page.dart';
import 'package:dept_counter/page/sub_summary_page/summary_page.dart';

import 'package:dept_counter/page/account/account_setting_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map<String, dynamic> userData = {};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => Loading(),
        '/login': (context) => LoginPage(),
        // '/login-loading': (context) => LoginLoading(),
        '/register': (context) => RegisterPage(),
        // '/register-loading': (context) => RegisterLoading(),
        '/register-add-info': (context) => RegisterAddInfoPage(userData),
        '/home': (context) => Homepage(userData),
        '/dept-page': (context) => DeptPage(userData),
        '/dept-add-topic-info-page': (context) =>
            DeptAddTopicInfoPage(userData),
        // '/dept-add-time-info-page': (context) => DeptAddTimeInfoPage(userData),
        // '/dept-create-and-modify-dept-list-page': (context) =>
        //     DeptCreateAndModifyDeptListPage(),

        '/summary': (context) => SummaryPage(userData),
        '/account': (context) => AccountSettingPage(),
      },
    );
  }
}
