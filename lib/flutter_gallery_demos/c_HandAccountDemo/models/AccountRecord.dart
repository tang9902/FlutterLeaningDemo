import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/db/SQLiteDB.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/models/Course.dart';
import 'package:sqflite/sqflite.dart';

import 'Account.dart';

class AccountRecord with ChangeNotifier{
  int id;
  int courseId;
  Course course;
  int accountId;
  Account account;
  double amount;
  String comment;
  int createdAt;
  int updatedAt;
  bool isDoneFetchRelationData = false;
  AccountRecord({this.id,this.courseId,this.accountId,this.amount,this.comment,this.updatedAt,this.createdAt});
  static AccountRecord fromMap(Map<String, dynamic> map){
    return AccountRecord(
      id: map['id'],
      courseId: map['courseId'],
      accountId: map['accountId'],
      amount: map['amount'],
      comment: map['comment'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'id':this.id,
      'courseId': courseId,
      'accountId': accountId,
      'amount': amount,
      'comment': comment,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  Future<void> fetchRelationData() async{
    this.isDoneFetchRelationData = false;
    var db = await SQLiteDB.getInstance();
    var resMaps = await db.query(
        'course',
        where: 'id=?',
        whereArgs: [this.courseId],
        limit: 1
    );
    this.course =  Course.fromMap(resMaps[0]);

    resMaps = await db.query(
        'account',
        where: 'id=?',
        whereArgs: [this.accountId],
        limit: 1
    );
    this.account = Account.fromMap(resMaps[0]);
    this.isDoneFetchRelationData = true;
  }

  static Future<List<AccountRecord>> fetchRelationDatas(List<AccountRecord> accountRecords) async{
    for(int i=0;i<accountRecords.length;i++){
      await accountRecords[i].fetchRelationData();
    }
    return accountRecords;
  }

  /*状态及异变*/
  Future<List<Map<String,dynamic>>> mapList;
  void fetchMapListAndNotify(){
    mapList = _fetchMapList();
    notifyListeners();
  }
  static Future<List<Map<String,dynamic>>> _fetchMapList() async{
    // await Future.delayed(Duration(seconds: 5));
    Database db = await SQLiteDB.getInstance();
    var _mapList = await db.query('account_record', orderBy: 'createdAt DESC');
    var _modelList = _mapList.map((map) => AccountRecord.fromMap(map)).toList();
    await fetchRelationDatas(_modelList);
    _mapList = _modelList.map(
            (model){
          var map = model.toMap();
          map['courseName'] = model.course.name;
          map['accountName'] = model.account.name;
          return map;
        }
    ).toList();
    return _mapList;
  }

  static List<Map<String,dynamic>> mapListWithCourseTitle(List<Map<String,dynamic>> mapList){
    return mapList.map((map){map['title'] = map['courseName']; return map;}).toList();
  }

  static List<Map<String,dynamic>> mapListWithAccountTitle(List<Map<String,dynamic>> mapList){
    return mapList.map((map){map['title'] = map['accountName']; return map;}).toList();
  }
}