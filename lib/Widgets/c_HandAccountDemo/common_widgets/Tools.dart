import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Tools{
  static String formatDate(int millisecond, {String format="yyyy-MM-dd HH:mm:ss"}){
    var dateTime = DateTime.fromMillisecondsSinceEpoch(millisecond);
    // return '${dateTime.year}年${dateTime.month}月${dateTime.day}日${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
    // return '${dateTime.month}月${dateTime.day}日${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
    DateFormat formator = DateFormat(format);
    return formator.format(dateTime);
  }

  // 此处T表示Navigator.pop(context, T someData)
  static Future<int> openDialog<T>({BuildContext context, Widget dialogBody, String title}) async{
    return showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          titlePadding: EdgeInsets.all(0),
          title: ListTile(
            tileColor: Colors.blueAccent,
            title: Text(title,style: TextStyle(color: Colors.white),),
            trailing: IconButton(onPressed: ()=>Navigator.pop(context, 0), icon: Icon(Icons.close,color: Colors.white,),),
          ),
          children: [
            dialogBody
          ],
        );
      },
    );
  }
}