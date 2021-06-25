import 'package:flutter/material.dart';
import 'package:dept_counter/page/sub_dept_page/dept_add_time_info_page.dart';

class DeptAddTopicInfoPage extends StatefulWidget {
  final Map<String, dynamic> userData;
  DeptAddTopicInfoPage(this.userData);

  @override
  _DeptAddTopicInfoPageState createState() => _DeptAddTopicInfoPageState();
}

class _DeptAddTopicInfoPageState extends State<DeptAddTopicInfoPage> {
  final _formKey = GlobalKey<FormState>();
  // var curDeptNumber;

  Map<String, dynamic> newData = {
    'deptNumber': '',
    'deptInformation': <String, dynamic>{
      'deptTitle': '',
      'deptInfo': '',
      'deptTotalAmount': '',
      'deptStartDate': '',
      'deptEndDate': '',
      'deptTotalMonthPayment': '',
      'deptPaidMonth': '',
    }
  };

  // void addNewData() {
  //   print(widget.userData);
  //   print(widget.userData['deptTopicList']);
  //   var deptNumber = widget.userData['deptTopicList'].length + 1;
  //   newData['deptNumber'] = '$deptNumber';
  //   curDeptNumber = deptNumber;

  //   widget.userData['deptTopicList'].add(newData);
  //   print(widget.userData);
  // }

  void setNewData() {
    var deptNumber = widget.userData['deptTopicList'].length + 1;
    newData['deptNumber'] = '$deptNumber';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Add Dept'),
            automaticallyImplyLeading: false,
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      labelText: 'Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title required!';
                      }
                      newData['deptInformation']['deptTitle'] = value;
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      labelText: 'Info',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Topic required!';
                      }
                      newData['deptInformation']['deptInfo'] = value;
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      labelText: 'Total Dept Amount',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Total Dept required!';
                      }
                      newData['deptInformation']['deptTotalAmount'] = value;
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.redAccent),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/dept-page');
                      },
                      child: Text(
                        'Cancel',
                        // style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // addNewData();
                          setNewData();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DeptAddTimeInfoPage(widget.userData, newData),
                            ),
                          );
                        }
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
