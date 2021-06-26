import 'package:dept_counter/page/sub_dept_page/dept_page.dart';
import 'package:flutter/material.dart';
import 'package:dept_counter/page/sub_dept_page/dept_information_dept_list_page.dart';
// import 'package:dept_counter/modules/thousand_separator.dart';

class DeptInformationPage extends StatefulWidget {
  final Map<String, dynamic> userData;
  final deptIndex;
  DeptInformationPage(this.userData, this.deptIndex);

  @override
  _DeptInformationPageState createState() => _DeptInformationPageState();
}

class _DeptInformationPageState extends State<DeptInformationPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DeptPage(widget.userData)));
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Dept Information'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Topic'),
                TextFormField(
                  initialValue: widget.userData['deptTopicList']
                      [widget.deptIndex]['deptInformation']['deptTitle'],
                  readOnly: true,
                ),
                SizedBox(height: 10.0),
                Text('Info'),
                TextFormField(
                  initialValue: widget.userData['deptTopicList']
                      [widget.deptIndex]['deptInformation']['deptInfo'],
                  readOnly: true,
                ),
                SizedBox(height: 10.0),
                Text('Total Amount'),
                TextFormField(
                  initialValue: widget.userData['deptTopicList']
                      [widget.deptIndex]['deptInformation']['deptTotalAmount'],
                  readOnly: true,
                ),
                SizedBox(height: 10.0),
                Text('Total Month Payment'),
                TextFormField(
                  initialValue: widget.userData['deptTopicList']
                          [widget.deptIndex]['deptInformation']
                      ['deptTotalMonthPayment'],
                  readOnly: true,
                ),
                SizedBox(height: 10.0),
                Text('Start Date'),
                TextFormField(
                  initialValue: widget.userData['deptTopicList']
                      [widget.deptIndex]['deptInformation']['deptStartDate'],
                  readOnly: true,
                ),
                SizedBox(height: 10.0),
                Text('End Date'),
                TextFormField(
                  initialValue: widget.userData['deptTopicList']
                      [widget.deptIndex]['deptInformation']['deptEndDate'],
                  readOnly: true,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeptInformationDeptListPage(
                              widget.userData, widget.deptIndex),
                        ),
                      );
                    },
                    child: Text('View List'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// inputFormatters: [ThousandsSeparatorInputFormatter()]
