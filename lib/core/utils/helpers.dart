import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helpers {
  const Helpers._();

  static String getCurrentDate() {
    final DateTime currentDateTime = DateTime.now();
    String todayDate = DateFormat('yyyy-MM-dd').format(currentDateTime);
    return todayDate;
  }

  static String getCurrentTime() {
    final TimeOfDay currentTimeOfDay = TimeOfDay.now();
    String formattedCurrentTime =
        '${currentTimeOfDay.hour.toString().padLeft(2, '0')}:${currentTimeOfDay.minute.toString().padLeft(2, '0')}';

    return formattedCurrentTime;
  }
}
