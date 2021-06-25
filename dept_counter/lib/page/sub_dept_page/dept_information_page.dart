import 'package:flutter/material.dart';

class DeptInformationPage extends StatefulWidget {
  // const DeptInformationPage({Key? key}) : super(key: key);
  final Map<String, dynamic> data;

  DeptInformationPage(this.data);

  @override
  _DeptInformationPageState createState() => _DeptInformationPageState();
}

class _DeptInformationPageState extends State<DeptInformationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.data['deptInformation']['deptTitle']}'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('${widget.data['deptInformation']['deptInfo']}'),
            Text('${widget.data['deptInformation']['deptTotalAmount']}'),
            Text('${widget.data['deptInformation']['deptStartDate']}'),
            Text('${widget.data['deptInformation']['deptEndDate']}'),
            Text('${widget.data['deptInformation']['deptTotalMonthPayment']}'),
            Text('${widget.data['deptInformation']['deptPaidMonth']}'),
          ],
        ),
      ),
    );
  }
}
