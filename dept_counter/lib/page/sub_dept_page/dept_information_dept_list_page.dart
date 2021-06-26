import 'package:flutter/material.dart';
import 'package:dept_counter/page/sub_dept_page/dept_information_loading.dart';

class DeptInformationDeptListPage extends StatefulWidget {
  final Map<String, dynamic> userData;
  final deptIndex;
  DeptInformationDeptListPage(this.userData, this.deptIndex);

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
    totalMonth = int.parse(widget.userData['deptTopicList'][widget.deptIndex]
        ['deptInformation']['deptTotalMonthPayment']);

    lastIndexOfPaid = widget.userData['deptTopicList'][widget.deptIndex]
            ['deptInformation']['deptPaidMonthList']
        .lastIndexOf(true);
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

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DeptInformationLoading(widget.userData, widget.deptIndex)));
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('View Dept List'),
            centerTitle: true,
          ),
          // floatingActionButton: FloatingActionButton.extended(
          //   icon: const Icon(Icons.add),
          //   onPressed: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => DeptAddTopicInfoPage(widget.userData),
          //       ),
          //     );
          //   },
          //   label: const Text('Create'),
          // ),
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
                      value: widget.userData['deptTopicList'][widget.deptIndex]
                          ['deptInformation']['deptPaidMonthList'][index],
                      onChanged: (bool? value) {
                        setState(() {
                          widget.userData['deptTopicList'][widget.deptIndex]
                                  ['deptInformation']['deptPaidMonthList']
                              [index] = value!;
                          // print(
                          //     'paid = > ${widget.userData['deptInformation']['deptPaidMonthList']}');
                        });
                      },
                    )),

                    // DataCell(DeptInfoCheckBox()),
                    DataCell(Text('${index + 1}')),
                    DataCell(Text(
                      '${widget.userData['deptTopicList'][widget.deptIndex]['deptInformation']['deptPerMonthList'][index].toStringAsFixed(2)}',
                    )
                        // TextFormField(
                        //   initialValue:
                        //       '${widget.userData['deptInformation']['deptPerMonthList'][index]}',
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
