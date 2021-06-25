import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final Map<String, dynamic> userData;

  SummaryPage(this.userData);

  var totalDeptCard;
  double totalDeptAmount = 0;
  double totalPaidAmount = 0;

  void init() {
    dynamic dynamicList = userData['deptTopicList'];
    totalDeptCard = dynamicList.length;

    // print(dynamicList);

    for (Map item in dynamicList) {
      totalDeptAmount +=
          double.parse(item['deptInformation']['deptTotalAmount']);
    }
    print('total = $totalDeptAmount');
  }

  @override
  Widget build(BuildContext context) {
    init();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Summary Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Total Dept Card'),
              TextFormField(
                initialValue: '$totalDeptCard',
                readOnly: true,
              ),
              SizedBox(height: 10.0),
              Text('Total Dept Amount'),
              TextFormField(
                initialValue: '${totalDeptAmount.toStringAsFixed(2)}',
                readOnly: true,
              ),
              SizedBox(height: 10.0),
              Text('Total Paid Amount'),
              TextFormField(
                initialValue: '${totalPaidAmount.toStringAsFixed(2)}',
                readOnly: true,
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
