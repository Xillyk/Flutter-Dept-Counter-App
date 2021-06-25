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
  void _updateListView() {
    setState(() {});
  }

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
        itemBuilder: (context, i) {
          // if (i.isOdd)
          //   // return const Divider();
          //   return SizedBox(height: 20);
          // else {
          //   return _buildDeptCard(userData['deptTopicList'][i]);
          // }
          // final index = i ~/ 2;

          return _buildDeptCard(userData['deptTopicList'][i]);
        },
      );
    }
  }

  Widget _buildDeptCard(userData) {
    // return ListTile(
    //   title: Text('${data['deptNumber']}'),
    // );
    return Container(
      height: 120.0,
      child: InkWell(
        child: Card(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '# ${userData['deptNumber']}',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              '${userData['deptInformation']['deptTitle']}',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25.0,
                  color: Colors.pinkAccent),
            ),
          ],
        )),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DeptInformationPage(userData),
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
    return SafeArea(
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
    );
  }
}
