class Account{
  int id;
  String name;
  Account({this.id, this.name});

  static Account fromMap(Map<String, dynamic> map){
    return Account(id: map['id'], name: map['name']);
  }
  Map<String, dynamic> toMap(){
    return {
      'id':this.id,
      'name':this.name,
    };
  }

}