import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:dept_counter/page/sub_dept_page/dept_page.dart';

class Homepage extends StatelessWidget {
  final Map<String, dynamic> userData;

  Homepage(this.userData);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                createDeptCard(context, userData),
                createSummaryCard(context),
              ],
            ),
          ),
        ),
        drawer: HomeDrawer(userData),
      ),
    );
  }

  Widget createDeptCard(context, userData) {
    return Expanded(
      flex: 1,
      child: Card(
        child: InkWell(
          child: Center(
            child: Text(
              'Dept Reminder',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onTap: () {
            // Navigator.pushNamed(context, '/dept-page');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DeptPage(userData)));
          },
          splashColor:
              Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
        ),
      ),
    );
  }

  Widget createSummaryCard(context) {
    return Expanded(
      flex: 1,
      child: Card(
        child: InkWell(
          child: Center(
            child: Text(
              'Summary',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/summary');
          },
          splashColor:
              Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
        ),
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  final Map<String, dynamic> userData;
  HomeDrawer(this.userData);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  foregroundColor: Colors.amberAccent,
                  // backgroundImage: AssetImage('assets/benz.jpg'),
                  radius: 40.0,
                ),
                Text(
                  'Hi ${userData['Name']}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Account',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/account');
            },
          ),
          Divider(
            height: 15.0,
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
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
    );
  }
}
