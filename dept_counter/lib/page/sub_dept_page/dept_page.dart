import 'dart:math';

import 'package:dept_counter/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dept_counter/page/sub_dept_page/dept_information_page.dart';
import 'package:dept_counter/page/sub_dept_page/dept_add_topic_info_page.dart';

class DeptPage extends StatefulWidget {
  final Map<String, dynamic> userData;
  DeptPage(this.userData);

  @override
  _DeptPageState createState() => _DeptPageState();
}

class _DeptPageState extends State<DeptPage> {
  Widget _buildDeptListView(userData) {
    // print('userdata = $userData |  ${userData['deptTopicList']}');
    // if (userData['deptTopicList'].length == null) {
    //   print('IT NULL');
    //   return Container(
    //     child: Text('No dept list'),
    //   );
    // } else {
    if (true) {
      return ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: userData['deptTopicList'].length,
        itemBuilder: (context, deptIndex) {
          // if (i.isOdd)
          //   // return const Divider();
          //   return SizedBox(height: 20);
          // else {
          //   return _buildDeptCard(userData['deptTopicList'][i]);
          // }
          // final index = i ~/ 2;

          // return _buildDeptCard(userData['deptTopicList'][i]);

          return _buildDeptCard(userData, deptIndex);
        },
      );
    }
  }

  Widget _buildDeptCard(userData, deptIndex) {
    var lastIndexOfPaid = userData['deptTopicList'][deptIndex]
            ['deptInformation']['deptPaidMonthList']
        .lastIndexOf(true);
    var lastMonthOfPaid = lastIndexOfPaid + 1;
    if (lastIndexOfPaid == -1) {
      lastIndexOfPaid = 0;
    }

    return Container(
      height: 120.0,
      child: InkWell(
        child: Card(
            // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            color: Color(
                userData['deptTopicList'][deptIndex]['color']['cardColor']),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '# ${userData['deptTopicList'][deptIndex]['deptNumber']} ${userData['deptTopicList'][deptIndex]['deptInformation']['deptTitle']}',
                  style: TextStyle(fontSize: 20.0),
                ),
                // Text(
                //   '${userData['deptInformation']['deptTitle']}',
                //   style: TextStyle(
                //       fontWeight: FontWeight.w500,
                //       fontSize: 25.0,
                //       color: Colors.pinkAccent),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'Month $lastMonthOfPaid / ${userData['deptTopicList'][deptIndex]['deptInformation']['deptTotalMonthPayment']}'),
                  ],
                )
              ],
            )),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DeptInformationPage(userData, deptIndex),
            ),
          );
        },
      ),
    );
  }

//      Expanded(
  //   child: Card(
  //     child: InkWell(
  //       onTap: () {
  //         // Navigator.push(
  //         //     context, MaterialPageRoute(builder: (context) => DeptPage()));
  //       },
  //       splashColor:
  //           Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
  //     ),
  //   ),
  // ),
  @override
  Widget build(BuildContext context) {
    print('deptpage data = ${widget.userData}');
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Homepage(widget.userData)));
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Dept Page'),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DeptAddTopicInfoPage(widget.userData),
                ),
              );
            },
            label: const Text('Create'),
          ),
          body: _buildDeptListView(widget.userData),
        ),
      ),
    );
  }
}
