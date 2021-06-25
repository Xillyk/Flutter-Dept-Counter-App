import 'package:flutter/material.dart';

class DeptInformationDeptListPage extends StatefulWidget {
  final Map<String, dynamic> data;

  DeptInformationDeptListPage(this.data);

  @override
  _DeptInformationDeptListPageState createState() =>
      _DeptInformationDeptListPageState();
}

class _DeptInformationDeptListPageState
    extends State<DeptInformationDeptListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('View Dept List'),
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
                initialValue: widget.data['deptInformation']['deptTitle'],
                readOnly: true,
              ),

              // Text('${widget.data['deptInformation']['deptTotalMonthPayment']}'),
              // Text('${widget.data['deptInformation']['deptPaidMonthList']}'),
            ],
          ),
        ),
      ),
    );
  }
}
