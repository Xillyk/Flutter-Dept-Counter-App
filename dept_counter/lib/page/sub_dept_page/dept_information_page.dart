import 'package:flutter/material.dart';
import 'package:dept_counter/page/sub_dept_page/dept_information_dept_list_page.dart';
// import 'package:dept_counter/modules/thousand_separator.dart';

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
                initialValue: widget.data['deptInformation']['deptTitle'],
                readOnly: true,
              ),
              SizedBox(height: 10.0),
              Text('Info'),
              TextFormField(
                initialValue: widget.data['deptInformation']['deptInfo'],
                readOnly: true,
              ),
              SizedBox(height: 10.0),
              Text('Total Amount'),
              TextFormField(
                initialValue: widget.data['deptInformation']['deptTotalAmount'],
                readOnly: true,
              ),
              SizedBox(height: 10.0),
              Text('Total Month Payment'),
              TextFormField(
                initialValue: widget.data['deptInformation']
                    ['deptTotalMonthPayment'],
                readOnly: true,
              ),
              SizedBox(height: 10.0),
              Text('Start Date'),
              TextFormField(
                initialValue: widget.data['deptInformation']['deptStartDate'],
                readOnly: true,
              ),
              SizedBox(height: 10.0),
              Text('End Date'),
              TextFormField(
                initialValue: widget.data['deptInformation']['deptEndDate'],
                readOnly: true,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DeptInformationDeptListPage(widget.data),
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
    );
  }
}
// inputFormatters: [ThousandsSeparatorInputFormatter()]
