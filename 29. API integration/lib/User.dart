
import 'http.dart';

class User {
  int userId;
  int id;
  String title;
  String body;

  User({this.userId, this.id, this.title, this.body});

  User.fromJson(Map<String, dynamic> json) {
    try {
      userId  = json['userId'];
      id      = json['id'];
      title   = json['title'];
      body    = json['body'];
    } catch (error) {
      throw "User.fromJson => $error";
    }
  }

}



class UserExt {

  static Future<User> getUserInfo() async{
    final jsonData = await HTTP.get(api: "https://jsonplaceholder.typicode.com/posts/1");
    return User.fromJson(jsonData);
  }

}

