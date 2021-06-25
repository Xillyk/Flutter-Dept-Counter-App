import 'package:dept_counter/page/sub_dept_page/dept_loading.dart';

import 'package:flutter/material.dart';

class DeptCreateAndModifyDeptListPage extends StatefulWidget {
  final Map<String, dynamic> userData;
  final Map<String, dynamic> newData;

  DeptCreateAndModifyDeptListPage(this.userData, this.newData);

  @override
  _DeptCreateAndModifyDeptListPageState createState() =>
      _DeptCreateAndModifyDeptListPageState();
}

class _DeptCreateAndModifyDeptListPageState
    extends State<DeptCreateAndModifyDeptListPage> {
  var totalDept, totalMonth, amountPerMonth;
  double sumDeptInList = 0;

  List deptPerMonthArray = [];

  void init() {
    totalDept =
        double.parse(widget.newData['deptInformation']['deptTotalAmount']);
    totalMonth =
        int.parse(widget.newData['deptInformation']['deptTotalMonthPayment']);
    amountPerMonth = totalDept / totalMonth;
    deptPerMonthArray =
        List.filled(totalMonth, amountPerMonth, growable: false);
    // print(deptPerMonthArray);
    for (double d in deptPerMonthArray) {
      sumDeptInList += d;
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dept List | $totalDept | $sumDeptInList'),
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.send),
          onPressed: () {
            widget.userData['deptTopicList'].add(widget.newData);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DeptLoading(widget.userData),
              ),
            );
          },
          label: const Text('Confirm'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            // columnSpacing: 50.0,
            columns: <DataColumn>[
              DataColumn(
                label: Text('Month'),
              ),
              // DataColumn(
              //   label: Text('Date'),
              // ),
              DataColumn(
                label: Text('Dept/Month'),
              ),
              // // DataColumn(
              //   label: Text('Payment'),
              // )
            ],
            rows: List<DataRow>.generate(
              totalMonth,
              (index) => DataRow(
                color: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  // All rows will have the same selected color.
                  if (states.contains(MaterialState.selected)) {
                    return Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.08);
                  }
                  // Even rows will have a grey color.
                  if (index.isEven) {
                    return Colors.amber.withOpacity(0.4);
                  }
                  return null; // Use default value for other states and odd rows.
                }),
                cells: <DataCell>[
                  DataCell(Text('${index + 1}')),
                  DataCell(
                    TextFormField(
                      initialValue: '$amountPerMonth',
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (val) {
                        print('onSubmited $val at month-${index + 1}');
                        deptPerMonthArray[index] = double.parse(val);
                        // print('new arr = $deptPerMonthArray');
                        setState(() {
                          sumDeptInList = 0;
                          for (double d in deptPerMonthArray) {
                            sumDeptInList += d;
                          }
                        });
                      },
                    ),
                    showEditIcon: true,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
