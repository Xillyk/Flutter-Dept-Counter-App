import 'package:flutter/material.dart';
import 'package:dept_counter/modules/datePickerWidget.dart';
import 'package:dept_counter/page/sub_dept_page/dept_create_and_modify_dept_list_page.dart';

class DeptAddTimeInfoPage extends StatefulWidget {
  final Map<String, dynamic> userData;
  final Map<String, dynamic> newData;

  DeptAddTimeInfoPage(this.userData, this.newData);

  @override
  _DeptAddTimeInfoPageState createState() => _DeptAddTimeInfoPageState();
}

class _DeptAddTimeInfoPageState extends State<DeptAddTimeInfoPage> {
  final _formKey = GlobalKey<FormState>();

  DatePickerWidget startDatePickerWidget =
      DatePickerWidget(buttonName: 'Start Date');
  DatePickerWidget endDatePickerWidget =
      DatePickerWidget(buttonName: 'End Date');

  bool isDateSelected() {
    DateTime? startDate, endDate;
    startDate = startDatePickerWidget.getSelectedDate();
    endDate = endDatePickerWidget.getSelectedDate();
    print('st = $startDate | end = $endDate');
    if (startDate != null && endDate != null) {
      return true;
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Time Info'),
          automaticallyImplyLeading: false,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    labelText: 'Amount month payment *',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Amount month payment required!';
                    }
                    widget.newData['deptInformation']['deptTotalMonthPayment'] =
                        value;
                    return null;
                  },
                ),
              ),
              // StartDatePickerWidget(),
              // EndDatePickerWidget(),
              startDatePickerWidget,
              endDatePickerWidget,
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
                      // style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (isDateSelected()) {
                        if (_formKey.currentState!.validate()) {
                          print('newdata = ${widget.newData}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DeptCreateAndModifyDeptListPage(
                                      widget.userData, widget.newData),
                            ),
                          );
                        }
                      } else {
                        final snackBar = SnackBar(
                          content: Text(
                            'Please select Start and End Date!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
    );
  }
}
