import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker {
  static Future<DateTime> show({BuildContext context}) async {
    DateTime selectedDate = DateTime.now();

    if (Platform.isAndroid) {
      selectedDate = await showDatePicker(
          builder: (context, child) {
            return Theme(
              data: ThemeData.light().copyWith(
                canvasColor: Color(0xff6E317A),
                colorScheme: ColorScheme.light(
                  primary: Color(0xff6E317A),
                  brightness: Brightness.dark,
                ),
                buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                ),
              ),
              child: child,
            );
          },
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1900),
          lastDate: selectedDate);
    } else if (Platform.isIOS) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
                onDateTimeChanged: (DateTime newdate) {
                  selectedDate = newdate;
                },
                initialDateTime: selectedDate,
                mode: CupertinoDatePickerMode.date,
                minimumDate: DateTime(1900),
                maximumDate: selectedDate),
          );
        },
      );
    }
    return selectedDate;
  }
}
