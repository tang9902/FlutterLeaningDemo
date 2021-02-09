import 'package:sqflite/sqflite.dart';

Future<void> initDatabase(Database db) async{
  var batch = db.batch();

  batch.execute('DROP TABLE IF EXISTS "account_record"');
  batch.execute('''
  CREATE TABLE "account_record" (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "courseId" integer NOT NULL,
      "accountId" integer NOT NULL,
      "comment" TEXT NOT NULL,
      "amount" real NOT NULL,
      "createdAt" INTEGER DEFAULT (cast(strftime('%s','now') as int)),
      "updatedAt" INTEGER DEFAULT (cast(strftime('%s','now') as int))
  )''');
  batch.execute('DROP TABLE IF EXISTS "account"');
  batch.execute('''CREATE TABLE "account" (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "name" TEXT UNIQUE
  )''');
  batch.execute("INSERT INTO account (id,name) VALUES (1,'现金')");
  batch.execute("INSERT INTO account (id,name) VALUES (2,'借记卡')");
  batch.execute("INSERT INTO account (id,name) VALUES (3,'信用卡')");


  batch.execute('DROP TABLE IF EXISTS "course"');
  batch.execute('''
  CREATE TABLE "course" (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "name" TEXT UNIQUE
  )''');
  batch.execute("INSERT INTO course (id,name) VALUES (1,'交通费用')");
  batch.execute("INSERT INTO course (id,name) VALUES (2,'通迅费用')");
  batch.execute("INSERT INTO course (id,name) VALUES (3,'餐饮费用')");

  batch.execute('DROP TABLE IF EXISTS "user"');
  batch.execute('''
  CREATE TABLE "user" (
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "name" TEXT UNIQUE,
      "password" TEXT
  )''');
  await batch.commit();
}