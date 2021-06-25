import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  final String? buttonName;

  DatePickerWidget({Key? key, this.restorationId, this.buttonName})
      : super(key: key);

  final String? restorationId;

  DateTime? date;

  DateTime? getSelectedDate() {
    return date;
    // String selectedDate =
    //     '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}';
    // return selectedDate;
  }

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// RestorationProperty objects can be used because of RestorationMixin.
class _DatePickerWidgetState extends State<DatePickerWidget>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.

  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
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
      print('nsd = $newSelectedDate');
      widget.date = newSelectedDate;
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            '${widget.buttonName} : ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}',
          ),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
          onPressed: () {
            _restorableDatePickerRouteFuture.present();
          },
          child: Text('${widget.buttonName}'),
        ),
        Text(
          '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}',
        ),
      ],
    );
  }
}
