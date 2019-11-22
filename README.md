# Date Picker Input

Example code for a date picker input widget in Flutter.

When the TextFormField is tapped, a bottom sheet (showModalBottomSheet) opens with a CupertinoDatePicker for date selection.

When the FlatButton is tapped, the date selection is added to the input field.

### Screenshots

|![Empty Input](https://github.com/devinsays/date_picker_input/raw/master/screenshots/screen-1.jpg)| ![Validation Error](https://github.com/devinsays/date_picker_input/raw/master/screenshots/screen-2.jpg)| ![Date Picker](https://github.com/devinsays/date_picker_input/raw/master/screenshots/screen-3.jpg)|

### To Use

To use this in your own project, you will need to make some minor adaptations. This project uses a custom `StyledFlatButton` widget for convenience, but you'll likely want to swap that out for your own FlatButton. The `Styles` are also included for convenience, but you'll likely want to use your own or defaults from your Material Theme.

### Widget Example

```dart
DatePickerInput(
  onChanged: (date) {
    // Do Something
  },
);
```

### Validation Example

Validation is optional. If you wish to do validation as part of a `Form` widget, make sure `DatePickerInput` is a child of `Form`.

Here's an example validation:

```dart
Form(
  key: _formKey,
  child: DatePickerInput(
    onChanged: (date) {
      // Do Something
    },
    validator: (String value) {
      // Basic validation example.
      if (value.isEmpty) {
        return 'Please enter a date.';
      }
      return null;
    },
  ),
);
```

### Tests

A test for this widget is included in the `test` folder.