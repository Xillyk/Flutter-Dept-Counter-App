import 'package:flutter/material.dart';

class DeptCreateAndModifyDeptListPage extends StatefulWidget {
  // const DeptCreateAndModifyDeptListPage({Key? key}) : super(key: key);

  @override
  _DeptCreateAndModifyDeptListPageState createState() =>
      _DeptCreateAndModifyDeptListPageState();
}

class _DeptCreateAndModifyDeptListPageState
    extends State<DeptCreateAndModifyDeptListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dept List'),
          automaticallyImplyLeading: false,
        ),
        body: DataTable(
          columns: <DataColumn>[
            DataColumn(
              label: Text('*'),
            ),
            DataColumn(
              label: Text('Date'),
            ),
            DataColumn(
              label: Text('Dept Amount'),
            ),
            // DataColumn(
            //   label: Text('Payment'),
            // )
          ],
          rows: [],
        ),

        // body:
      ),
    );
  }
}
