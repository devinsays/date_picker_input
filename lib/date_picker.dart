import 'package:flutter/cupertino.dart';

class DatePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime minimumDate;
  final DateTime maximumDate;
  final Function onChange;
  final Function onConfirm;
  final Function onCancel;

  const DatePicker({
    Key key,
    this.initialDate,
    this.onChange,
    this.minimumDate,
    this.maximumDate,
    this.onConfirm,
    this.onCancel,
  }) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime pendingSelection;

  Widget build(BuildContext context) {
    return CupertinoDatePicker(
      mode: CupertinoDatePickerMode.date,
      initialDateTime: widget.initialDate,
      maximumDate: widget.maximumDate,
      minimumDate: widget.minimumDate,
      maximumYear: widget?.maximumDate?.year ?? DateTime.now().year,
      onDateTimeChanged: (date) {
        setState(() {
          pendingSelection = date;
        });
        if (widget.onChange != null) {
          widget.onChange(date);
        }
      },
    );
  }
}
