import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class SQLiteDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SQLiteDemo',
        home:Material(
          child: Scaffold(
            appBar: AppBar(title: Text('SQLiteDemo')),
            body: Demo(),
          ),
        )
    );
  }
}
/*-------------------------------------------*/

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  List<Dog> _dogs = [];
  int _id = 10;

  void _getDogs(){
    Dog.dogs().then((dogs){
      setState(() {
        _dogs = dogs;
      });
    });
  }

  void _insertDogs(){
    Dog.insertDog(Dog(id: _id++,name: 'tom${_id}', age: _id)).then((dogs){
      _getDogs();
    });
  }

  void _deleteDogs(int id){
    Dog.deleteDog(id).then((dogs){
      _getDogs();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(onPressed: _getDogs, child: Text('获取狗'),),
        RaisedButton(onPressed: _insertDogs, child: Text('增加狗'),),
        Container(
            height: 300,
            color: Colors.black12,
            child:ListView(
              children: [
                for(int i=0;i<_dogs.length;i++)
                  ListTile(
                    key: ValueKey(_dogs[i].id),
                    title: Text(_dogs[i].name + ':' + _dogs[i].age.toString() + '岁'),
                    subtitle: RaisedButton(onPressed: () => _deleteDogs(_dogs[i].id), child: Text('删除狗'),),
                  )
              ],
            )
        )
      ],
    );
  }
}


/*-------------------------------------------*/
class DBConnection{
  static Database _database;
  static Future<Database> getSingletonDatabase() async{
    if(_database == null) {
      final String databasePath = join(await getDatabasesPath(), 'doggie_database.db');
      return openDatabase(
          databasePath,
          onCreate: (db ,version){
            return db.execute('CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
          },
          version: 1
      );
    }
    return _database;
  }
}

class Dog{
  final int id;
  final String name;
  final int age;
  Dog({this.id, this.name, this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  static Dog dogOnMap(Map<String,dynamic> map){
    return Dog(
      id: map['id'],
      name: map['name'],
      age: map['age'],
    );
  }

  static Future<void> insertDog(Dog dog) async{
    final Database db = await DBConnection.getSingletonDatabase();
    await db.insert(
        'dogs',
        dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  static Future<List<Dog>> dogs() async{
    final Database db = await DBConnection.getSingletonDatabase();
    final List<Map<String,dynamic>> maps = await db.query('dogs');
    var dogs = List.generate(maps.length, (index) => dogOnMap(maps[index]));
    print(dogs);
    return dogs;
  }

  static Future<void> updateDog(Dog dog) async{
    final db = await DBConnection.getSingletonDatabase();
    await db.update(
        'dogs',
        dog.toMap(),
        where: "id = ?",
        whereArgs: [dog.id]
    );
  }

  static Future<void> deleteDog(int id) async {
    final Database db = await DBConnection.getSingletonDatabase();
    await db.delete(
        'dogs',
        where: "id = ?",
        whereArgs: [id]
    );
  }
}

