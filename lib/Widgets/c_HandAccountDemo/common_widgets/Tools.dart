import 'package:intl/intl.dart';

class Tools{
  static String formatDate(int millisecond, {String format="yyyy-MM-dd HH:mm:ss"}){
    var dateTime = DateTime.fromMillisecondsSinceEpoch(millisecond);
    // return '${dateTime.year}年${dateTime.month}月${dateTime.day}日${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
    // return '${dateTime.month}月${dateTime.day}日${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
    DateFormat formator = DateFormat(format);
    return formator.format(dateTime);
  }
}