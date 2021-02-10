class User{
  int id;
  String name;
  String password;
  User({this.id,this.name,this.password});

  static User fromMap(Map<String, dynamic> map){
    return User(
        id: map['id'],
        name: map['name'],
        password: map['password']
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'id':this.id,
      'name':this.name,
      'password':this.password
    };
  }
}