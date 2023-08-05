import 'dart:math';

import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';

extension date on DateTime {
  ///Example:
  ///Convert 2023-5-9 21:12:23:000Z to 9,May 2023

  String get toPkDate {
    int day = this.day;
    var monthNames = [
      " ",
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return "${day} ${monthNames[this.month]}, ${this.year}";
  }

  ///Example:
  ///Convert 2023-5-9 21:12:23:000Z to 9:12:23 PM
  String get toPkTime {
    int hour = this.hour;
    int minute = this.minute;
    int sec = this.second;

    return "${hour > 12 ? hour - 12 : hour}:$minute:$sec ${hour > 12 ? "PM" : "AM"}";
  }

  ///Example:
  ///Convert 2023-5-9 21:12:23:000Z to 9:12 PM
  String get toHourAndMinutes {
    int hour = this.hour;
    int minute = this.minute;
    int sec = this.second;

    return "${hour > 12 ? hour - 12 : hour}:$minute ${hour > 12 ? "PM" : "AM"}";
  }

  String timeAgo({bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);return "$hour:$minute";
  }

  String get humanReadableDate {
    //print("object");
    return intl.DateFormat('yyyy-MM-dd').format(this);
  }
  String get weekName{

    return DateFormat('EEEE').format(this);

  }
  DateTime get nowTypeFormatData{


    DateFormat outputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");


    String formattedDate = outputFormat.format(this);

    return DateTime.parse(formattedDate);

  }



}


extension str on String{
  String get readableTime{

    DateTime dateTime = DateTime.parse(this);
    String timeString = DateFormat.Hm().format(dateTime);
    return timeString;

  }

}


