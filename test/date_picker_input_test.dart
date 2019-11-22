import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:date_picker_input/date_picker_input.dart';
import 'package:date_picker_input/date_picker.dart';
import 'package:date_picker_input/styled_flat_button.dart';

void main() {
  testWidgets('DatePickerInput Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      // DatePickerInput must be a child of MaterialApp and Scaffold.
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Container(
              child: DatePickerInput(
                key: Key('date-picker'),
                onChanged: (date) {
                  // print('Selected date: $date');
                },
              ),
            ),
          ),
        ),
      ),
    );

    // DatePicker Input Field
    Finder input = find.byType(TextFormField).first;

    await tester.tap(input);
    await tester.pumpAndSettle();

    // Expects the DatePicker widget and button to be available.
    expect(find.byType(DatePicker), findsOneWidget);
    expect(find.byType(StyledFlatButton), findsOneWidget);

    // This is a workaround for closing the drawer.
    // tester.tap(find.byType(StyledFlatButton)) did not work correctly.
    // More detail: https://github.com/flutter/flutter/issues/31066
    StyledFlatButton button =
        find.byType(StyledFlatButton).evaluate().first.widget;
    button.onPressed();
    await tester.pumpAndSettle();
    expect(find.byType(DatePicker), findsNothing);

    // Since no date was selected, we expect to see the current date.
    String date = DateFormat.yMMMd().format(DateTime.now());
    expect(find.text(date), findsOneWidget);

    // Re-open the picker to select a different date
    await tester.tap(input);
    await tester.pumpAndSettle();

    String currentYear = DateFormat.y().format(DateTime.now());

    // Finds the current year on the date selector, and de-increments it by one.
    await tester.drag(find.text(currentYear), Offset(0.0, 40.0));
    await tester.pumpAndSettle();
    button = find.byType(StyledFlatButton).evaluate().first.widget;
    button.onPressed();
    await tester.pumpAndSettle();

    // Verifies text with current date minus one year is visible.
    // i.e. if initial date year is 2020, new date year should be 2019.
    DateTime initialDate = DateTime.now();
    DateTime previousYear = DateTime(
      initialDate.year - 1,
      initialDate.month,
      initialDate.day,
      initialDate.hour,
      initialDate.minute,
      initialDate.second,
      initialDate.millisecond,
      initialDate.microsecond,
    );

    String updatedDate = DateFormat.yMMMd().format(previousYear);
    expect(find.text(updatedDate), findsOneWidget);

    // For debugging purposes, controller text can be outputted.
    // TextFormField input = find.byType(TextFormField).evaluate().first.widget;
    // print(input);
    // print(input.controller.value.text);
  });
}
