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
                (monthIndex) => DataRow(
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
                        if (monthIndex == 0) {
                          return Colors.red.withOpacity(0.4);
                        } else {
                          return Colors.amber.withOpacity(0.4);
                        }
                      } else {
                        if (monthIndex <= lastIndexOfPaid) {
                          return Colors.green.withOpacity(0.4);
                        } else if (monthIndex == (lastIndexOfPaid + 1)) {
                          return Colors.red.withOpacity(0.4);
                        } else {
                          return Colors.amber.withOpacity(0.4);
                        }
                      }

                      // else {}
                      // return null; // Use default value for other states and odd rows.
                    }),
                    cells: List<DataCell>.generate(3, (cellIndex) {
                      if (cellIndex == 0) {
                        if (lastIndexOfPaid == -1 && monthIndex == 0) {
                          return DataCell(Checkbox(
                            checkColor: Colors.white,
                            // fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: widget.userData['deptTopicList']
                                    [widget.deptIndex]['deptInformation']
                                ['deptPaidMonthList'][monthIndex],
                            onChanged: (bool? value) {
                              setState(() {
                                widget.userData['deptTopicList']
                                        [widget.deptIndex]['deptInformation']
                                    ['deptPaidMonthList'][monthIndex] = value!;
                              });
                            },
                          ));
                        } else if (monthIndex == (lastIndexOfPaid + 1)) {
                          return DataCell(Checkbox(
                            checkColor: Colors.white,
                            // fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: widget.userData['deptTopicList']
                                    [widget.deptIndex]['deptInformation']
                                ['deptPaidMonthList'][monthIndex],
                            onChanged: (bool? value) {
                              setState(() {
                                widget.userData['deptTopicList']
                                        [widget.deptIndex]['deptInformation']
                                    ['deptPaidMonthList'][monthIndex] = value!;
                              });
                            },
                          ));
                        } else {
                          return DataCell(Checkbox(
                            checkColor: Colors.white,
                            // fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: widget.userData['deptTopicList']
                                    [widget.deptIndex]['deptInformation']
                                ['deptPaidMonthList'][monthIndex],
                            onChanged: null,
                          ));
                        }
                      } else if (cellIndex == 1) {
                        return DataCell(Text('${monthIndex + 1}'));
                      } else {
                        return DataCell(Text(
                          '${widget.userData['deptTopicList'][widget.deptIndex]['deptInformation']['deptPerMonthList'][monthIndex].toStringAsFixed(2)}',
                        ));
                      }
                    })

                    // color: MaterialStateProperty.resolveWith<Color?>(
                    //     (Set<MaterialState> states) {
                    //   // All rows will have the same selected color.
                    //   if (states.contains(MaterialState.selected)) {
                    //     return Theme.of(context)
                    //         .colorScheme
                    //         .primary
                    //         .withOpacity(0.08);
                    //   }
                    //   // Even rows will have a grey color.
                    //   if (lastIndexOfPaid == -1) {
                    //     if (index == 0) {
                    //       return Colors.red.withOpacity(0.4);
                    //     } else {
                    //       return Colors.amber.withOpacity(0.4);
                    //     }
                    //   } else {
                    //     if (index <= lastIndexOfPaid) {
                    //       return Colors.green.withOpacity(0.4);
                    //     } else if (index == (lastIndexOfPaid + 1)) {
                    //       return Colors.red.withOpacity(0.4);
                    //     } else {
                    //       return Colors.amber.withOpacity(0.4);
                    //     }
                    //   }

                    // <DataCell>[
                    //   DataCell(Checkbox(
                    //     checkColor: Colors.white,
                    //     // fillColor: MaterialStateProperty.resolveWith(getColor),
                    //     value: widget.userData['deptTopicList'][widget.deptIndex]
                    //         ['deptInformation']['deptPaidMonthList'][index],
                    //     onChanged: (bool? value) {
                    //       setState(() {
                    //         widget.userData['deptTopicList'][widget.deptIndex]
                    //                 ['deptInformation']['deptPaidMonthList']
                    //             [index] = value!;
                    //       });
                    //     },
                    //   )),
                    //   DataCell(Text('${monthIndex + 1}')),
                    //   DataCell(Text(
                    //     '${widget.userData['deptTopicList'][widget.deptIndex]['deptInformation']['deptPerMonthList'][index].toStringAsFixed(2)}',
                    //   ))
                    // ],
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
