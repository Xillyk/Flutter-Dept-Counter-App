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
  var totalMonth;
  var lastIndexOfPaid;

  // Map<String, String> cellColor = {
  //   'green': '',
  //   'orange': '',
  //   'red': '',
  // };

  void setData() {
    totalMonth =
        int.parse(widget.data['deptInformation']['deptTotalMonthPayment']);

    lastIndexOfPaid =
        widget.data['deptInformation']['deptPaidMonthList'].lastIndexOf(true);
    print(lastIndexOfPaid);
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    setData();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('View Dept List'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columnSpacing: 20.0,
            columns: <DataColumn>[
              DataColumn(
                label: Text('Paid'),
              ),
              DataColumn(
                label: Text('Month'),
              ),
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
                  if (lastIndexOfPaid == -1) {
                    if (index == 0) {
                      return Colors.red.withOpacity(0.4);
                    } else {
                      return Colors.amber.withOpacity(0.4);
                    }
                  } else {
                    if (index <= lastIndexOfPaid) {
                      return Colors.green.withOpacity(0.4);
                    } else if (index == (lastIndexOfPaid + 1)) {
                      return Colors.red.withOpacity(0.4);
                    } else {
                      return Colors.amber.withOpacity(0.4);
                    }
                  }

                  // else {}
                  // return null; // Use default value for other states and odd rows.
                }),
                cells: <DataCell>[
                  DataCell(Checkbox(
                    checkColor: Colors.white,
                    // fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: widget.data['deptInformation']['deptPaidMonthList']
                        [index],
                    onChanged: (bool? value) {
                      setState(() {
                        widget.data['deptInformation']['deptPaidMonthList']
                            [index] = value!;
                        // print(
                        //     'paid = > ${widget.data['deptInformation']['deptPaidMonthList']}');
                      });
                    },
                  )),

                  // DataCell(DeptInfoCheckBox()),
                  DataCell(Text('${index + 1}')),
                  DataCell(Text(
                    '${widget.data['deptInformation']['deptPerMonthList'][index].toStringAsFixed(2)}',
                  )
                      // TextFormField(
                      //   initialValue:
                      //       '${widget.data['deptInformation']['deptPerMonthList'][index]}',
                      //   readOnly: true,
                      // ),
                      // showEditIcon: true,
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

// class DeptInfoCheckBox extends StatefulWidget {
//   const DeptInfoCheckBox({Key? key}) : super(key: key);

//   @override
//   _CheckDeptInfoBoxState createState() => _CheckDeptInfoBoxState();
// }

// class _CheckDeptInfoBoxState extends State<DeptInfoCheckBox> {
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     Color getColor(Set<MaterialState> states) {
//       const Set<MaterialState> interactiveStates = <MaterialState>{
//         MaterialState.pressed,
//         MaterialState.hovered,
//         MaterialState.focused,
//       };
//       if (states.any(interactiveStates.contains)) {
//         return Colors.blue;
//       }
//       return Colors.red;
//     }

//     return Checkbox(
//       checkColor: Colors.white,
//       fillColor: MaterialStateProperty.resolveWith(getColor),
//       value: isChecked,
//       onChanged: (bool? value) {
//         setState(() {
//           isChecked = value!;
//         });
//       },
//     );
//   }
// }
