import 'package:flutter_app/Widgets/c_HandAccountDemo/db/initSql.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDB{
  static Database _database;
  static Future<Database> getInstance() async{
    if(_database == null) {
      final String databasePath = join(await getDatabasesPath(), 'handAccountDatabase.db');
      /// tony!!! 如果要重新初始化数据库，直接把原来的app卸载掉，重新安装或运行即可
      return openDatabase(
          databasePath,
          onCreate: (db ,version){
            print('onCreate DB');
            return initDatabase(db);
          },
          onUpgrade: (db,oldVersion,version){
            print('onUpgrade DB');
            return initDatabase(db);
          },
          version: 1
      );
    }
    return _database;
  }
}