import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import 'package:dept_counter/page/sub_dept_page/dept_page.dart';
import 'package:dept_counter/page/sub_dept_page/dept_add_time_info_page.dart';

class DeptAddTopicInfoPage extends StatefulWidget {
  final Map<String, dynamic> userData;
  DeptAddTopicInfoPage(this.userData);

  @override
  _DeptAddTopicInfoPageState createState() => _DeptAddTopicInfoPageState();
}

class _DeptAddTopicInfoPageState extends State<DeptAddTopicInfoPage> {
  bool lightTheme = true;
  Color currentColor = Colors.limeAccent;
  List<Color> currentColors = [Colors.limeAccent, Colors.green];

  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);

  final _formKey = GlobalKey<FormState>();
  // var curDeptNumber;

  Map<String, dynamic> newData = {
    'deptNumber': '',
    'deptInformation': <String, dynamic>{
      'deptTitle': '',
      'deptInfo': '',
      'deptTotalAmount': '',
      'deptStartDate': '',
      'deptEndDate': '',
      'deptTotalMonthPayment': '',
      'deptPerMonthList': [],
      'deptPaidMonthList': [],
    },
    'color': <String, dynamic>{
      'cardColor': 0xffec407a,
      'titleColor': '',
    }
  };

  void setNewData() {
    var deptNumber = widget.userData['deptTopicList'].length + 1;
    newData['deptNumber'] = '$deptNumber';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Add Dept'),
            automaticallyImplyLeading: false,
          ),
          body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      labelText: 'Title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title required!';
                      }
                      newData['deptInformation']['deptTitle'] = value;
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      labelText: 'Info',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Topic required!';
                      }
                      newData['deptInformation']['deptInfo'] = value;
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      labelText: 'Total Dept Amount',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Total Dept required!';
                      }
                      newData['deptInformation']['deptTotalAmount'] = value;
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return MaterialColorPicker(
                                  onColorChange: (Color color) {
                                    setState(() {
                                      newData['color']['cardColor'] =
                                          color.value;
                                    });
                                    // print('Color change to -> $color');
                                  },
                                  selectedColor: Colors.pinkAccent);
                            });
                      },
                      child: Text('Select Card Color'),
                      style: ElevatedButton.styleFrom(
                          primary: Color(newData['color']
                              ['cardColor']), //background color of button

                          // side: BorderSide(
                          //     width: 3,
                          //     color: Colors.brown), //border width and color
                          // elevation: 3, //elevation of button
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(30)),
                          padding:
                              EdgeInsets.all(20) //content padding inside button
                          )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.redAccent),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (contex) =>
                                    DeptPage(widget.userData)));
                      },
                      child: Text(
                        'Cancel',
                        // style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // addNewData();
                          setNewData();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DeptAddTimeInfoPage(widget.userData, newData),
                            ),
                          );
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
      ),
    );
  }
}
