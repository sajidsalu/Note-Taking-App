import 'package:intl/intl.dart';

class DateUtil{

  static String formatDate(var timestamp){
    var date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp), isUtc: true).toLocal();
    var datetime=  DateFormat('dd-MM-yyyy').format(date);
    return datetime;
  }

  static String formattedDate(var timeStamp){
    var format = new DateFormat("yMd");
    var dateString = format.format(timeStamp);
    return dateString;
  }
}