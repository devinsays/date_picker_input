import 'package:flutter/material.dart';

import 'package:date_picker_input/styles.dart';
import 'package:date_picker_input/date_picker_input.dart';
import 'package:date_picker_input/styled_flat_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Picker Input',
      home: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Container(
          padding: EdgeInsets.all(25.0),
          child: DatePickerForm(),
        ),
      ),
    );
  }
}

class DatePickerForm extends StatefulWidget {
  @override
  _DatePickerForm createState() => _DatePickerForm();
}

class _DatePickerForm extends State<DatePickerForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submit() async {
    final form = _formKey.currentState;

    if (form.validate()) {
      print('Form validated.');
    }
  }

  Widget build(BuildContext context) {
    // DatePickerInput does not need to be a child of Form.
    // But it is useful for when you need to do form validation.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Select a Date',
            style: Styles.label,
          ),
          SizedBox(height: 10),
          DatePickerInput(
            onChanged: (date) {
              // This method is triggered everytime the date changes.
              // This value could be stored in state variable, e.g.:
              // setState(() { _dateVariable = date; });
              print('Selected date: $date');
            },
            validator: (String value) {
              // Basic validation example.
              if (value.isEmpty) {
                return 'Please enter a date.';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          StyledFlatButton(
            'Validate Form',
            onPressed: () => _submit(),
          ),
          SizedBox(height: 20),
          Text(
            'If a date is not selected, a validation message will show when the button is tapped.',
            style: Styles.p,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
