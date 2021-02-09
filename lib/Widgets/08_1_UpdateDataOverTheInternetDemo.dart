import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateDataOverTheInternetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'UpdateDataOverTheInternetDemo',
        home:Material(
          child: Scaffold(
            appBar: AppBar(title: Text('UpdateDataOverTheInternetDemo')),
            body: _Demo(),
          ),
        )
    );
  }
}


class _Demo extends StatefulWidget {
  _Demo({Key key}) : super(key: key);
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<_Demo> {
  final TextEditingController _controller = TextEditingController();
  Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = Album.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasData){
            return Column(
              children: [
                Text(snapshot.data.title),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(hintText: '请输入标题'),
                ),
                ElevatedButton(onPressed:() {
                  setState((){
                    _futureAlbum = Album.updateAlbum(_controller.text);
                });
                }, child: Text('更新数据')),
              ],
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text("${snapshot.error}"),
                ElevatedButton(onPressed:() {
                  setState((){
                    _futureAlbum = Album.fetchAlbum();
                  });
                }, child: Text('获取数据')),
              ],
            );
          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class Album{
  final int id;
  final String title;

  Album({this.id, this.title});
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        id: json['id'],
        title: json['title']
    );
  }

  // put 更新标题
  static Future<Album> updateAlbum(String title) async{
    final http.Response response = await http.put(
      'https://jsonplaceholder.typicode.com/albums',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String,String>{'title':title}),
    );
    if(response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('请求失败,response.statusCode:${response.statusCode}');
    }
  }

  // get 获取
  static Future<Album> fetchAlbum() async {
    final response =
    await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('请求失败,response.statusCode:${response.statusCode}');
    }
  }
}



