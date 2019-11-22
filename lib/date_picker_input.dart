import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:date_picker_input/styles/styles.dart';
import 'package:date_picker_input/styled_flat_button.dart';
import 'package:date_picker_input/date_picker.dart';

class DatePickerInput extends StatefulWidget {
  final DateTime date;
  final Function onChanged;
  final String hintText;
  final FormFieldValidator<String> validator;

  const DatePickerInput({
    this.date,
    @required this.onChanged,
    this.hintText,
    this.validator,
    Key key,
  }) : super(key: key);

  @override
  _DatePickerInputState createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  DateTime _selectedDate;
  TextEditingController _dateController = TextEditingController();

  initState() {
    super.initState();
    if (widget.date != null) {
      String formattedDate = DateFormat.yMMMd().format(widget.date);
      _dateController = TextEditingController(text: formattedDate);
    }
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Column(
              children: [
                StyledFlatButton(
                  'Done',
                  onPressed: () {
                    // If no date is selected, current date is used.
                    DateTime selectedDate = _selectedDate ?? DateTime.now();
                    widget.onChanged(selectedDate);
                    setState(() {
                      String formattedDate =
                          DateFormat.yMMMd().format(selectedDate);
                      _dateController =
                          TextEditingController(text: formattedDate);
                    });
                    Navigator.pop(context);
                  },
                  radius: 0.0,
                ),
                Expanded(
                  child: DatePicker(
                    onChange: (date) {
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
            );
          },
        );
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: _dateController,
          decoration: Styles.input.copyWith(
            hintText: widget.hintText ?? 'mm/dd/yy',
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
