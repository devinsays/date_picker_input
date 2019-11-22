import 'package:flutter/material.dart';

import 'package:date_picker_input/styles/styles.dart';
import 'package:date_picker_input/date_picker_input.dart';

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
                  print('Selected date: $date');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
