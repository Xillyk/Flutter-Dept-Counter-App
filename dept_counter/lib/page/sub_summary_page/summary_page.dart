import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class SummaryPage extends StatelessWidget {
  final Map<String, dynamic> userData;

  SummaryPage(this.userData);

  var totalDeptCard;
  var totalMonth;
  var lastIndexOfPaid;

  double totalDeptAmount = 0;
  double totalPaidAmount = 0;

  double totalPaidOfMonth = 0;

  double percentage = 0;

  Map<String, double> dataMap = {
    'Total_Dept_Amount': 0.0,
    'Total_Paid_Amount': 0.0,
  };

  void init() {
    dynamic dynamicList = userData['deptTopicList'];
    totalDeptCard = dynamicList.length;
    // print(dynamicList);
    for (Map item in dynamicList) {
      totalDeptAmount +=
          double.parse(item['deptInformation']['deptTotalAmount']);

      lastIndexOfPaid =
          item['deptInformation']['deptPaidMonthList'].lastIndexOf(true);

      item['deptInformation']['deptPerMonthList']
          .asMap()
          .forEach((index, amount) {
        if (index <= lastIndexOfPaid) {
          totalPaidOfMonth += amount;
        }
      });

      print('total paid of month = $totalPaidOfMonth');
      totalPaidAmount += totalPaidOfMonth;
      totalPaidOfMonth = 0;
    }
    print('total paid amount = $totalPaidAmount');
    calculatePercentage();

    dataMap['Total_Dept_Amount'] = totalDeptAmount;
    dataMap['Total_Paid_Amount'] = totalPaidAmount;
  }

  void calculatePercentage() {
    try {
      percentage = (totalPaidAmount / totalDeptAmount) * 100;
    } catch (err) {
      print(err);
      percentage = 0;
    }
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
              Text('Percentage'),
              TextFormField(
                initialValue: '${percentage.toStringAsFixed(2)} %',
                readOnly: true,
              ),
              SizedBox(height: 65.0),
              // PieChart(dataMap: dataMap),
              PieChart(
                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 2000),
                chartLegendSpacing: 45,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                // colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 35,
                // centerText: "HYBRID",
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  // legendShape: _BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
