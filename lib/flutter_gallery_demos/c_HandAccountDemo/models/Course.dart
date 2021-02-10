class Course{
  int id;
  String name;
  Course({this.id, this.name});

  static Course fromMap(Map<String, dynamic> map){
    return Course(
        id: map['id'],
        name: map['name']
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'id':this.id,
      'name':this.name,
    };
  }
}