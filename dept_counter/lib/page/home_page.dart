import 'package:flutter/material.dart';
import 'package:dept_counter/page/sub_dept_page/dept_page.dart';
import 'package:dept_counter/page/sub_summary_page/summary_page.dart';
import 'package:dept_counter/page/account/account_setting_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DeptCard(),
            SummaryCard(),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('User'),
            ),
            ListTile(
              title: Text('Account'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountSettingPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text('See you soon'),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DeptCard extends StatelessWidget {
  const DeptCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: 350,
            child: Card(
              child: InkWell(
                child: Column(
                  children: <Widget>[
                    Text('Dept Reminder'),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DeptPage()));
                },
                splashColor:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            width: 350,
            child: Card(
              child: InkWell(
                child: Column(
                  children: <Widget>[
                    Text('Summary'),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SummaryPage()));
                },
                splashColor:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
