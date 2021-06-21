import 'package:flutter/material.dart';

class DeptAddFormPage extends StatelessWidget {
  const DeptAddFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Dept'),
      ),
      body: DeptAddForm(),
    );
  }
}

class DeptAddForm extends StatefulWidget {
  const DeptAddForm({Key? key}) : super(key: key);

  @override
  _DeptAddFormState createState() => _DeptAddFormState();
}

class _DeptAddFormState extends State<DeptAddForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                labelText: 'Topic',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Topic required!';
                }
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
                labelText: 'Total Dept',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Total Dept required!';
                }
                return null;
              },
            ),
          ),
          // Text('Start'),
          StartDatePickerWidget(),
          EndDatePickerWidget(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white70,
                filled: true,
                labelText: 'Month',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Month required!';
                }
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
                labelText: 'Interest',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Interest required!';
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context);
              }
            },
            child: Text('Confirm'),
          )
        ],
      ),
    );
  }
}

class StartDatePickerWidget extends StatefulWidget {
  const StartDatePickerWidget({Key? key, this.restorationId}) : super(key: key);

  final String? restorationId;

  @override
  _StartDatePickerWidgetState createState() => _StartDatePickerWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// RestorationProperty objects can be used because of RestorationMixin.
class _StartDatePickerWidgetState extends State<StartDatePickerWidget>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021, 1, 1),
          lastDate: DateTime(2022, 1, 1),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Start Date: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () {
            _restorableDatePickerRouteFuture.present();
          },
          child: const Text('Start Date'),
        ),
        Text(
            '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
      ],
    );
  }
}

class EndDatePickerWidget extends StatefulWidget {
  const EndDatePickerWidget({Key? key, this.restorationId}) : super(key: key);

  final String? restorationId;

  @override
  _EndDatePickerWidgetState createState() => _EndDatePickerWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// RestorationProperty objects can be used because of RestorationMixin.
class _EndDatePickerWidgetState extends State<EndDatePickerWidget>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 24));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021, 1, 1),
          lastDate: DateTime(2022, 1, 1),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'End Date: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () {
            _restorableDatePickerRouteFuture.present();
          },
          child: const Text('End Date'),
        ),
        Text(
            '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
      ],
    );
  }
}
