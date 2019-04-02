class User {
  String name;
  int age;
  int id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['age'] = age;
    map['id'] = id;
    return map;
  }

  static User fromMap(Map<String, dynamic> map) {
    User user = new User();
    user.name = map['name'];
    user.age = map['age'];
    user.id = map['id'];
    return user;
  }

  static List<User> fromMapList(dynamic mapList) {
    List<User> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}
