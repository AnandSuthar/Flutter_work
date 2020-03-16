
import 'http.dart';

class User {
  String userId;
  int id;
  String title;
  String body;

  User({this.userId, this.id, this.title, this.body});

  User.fromJson(Map<String, dynamic> json) {
    try {
      userId = json['userId'];
      id = json['id'];
      title = json['title'];
      body = json['body'];
    } catch (error) {
      print("User.fromJson => $error");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }


}



class UserExt {

  static getUserInfo(Function(User user) success, Function(String errorMesssage) error) async{

    final response = await HTTP.get(api: "https://jsonplaceholder.typicode.com/posts/1");
    if(response.isSuccess == true) {
      success(User.fromJson(response.body));
    } else {
      error(response.body);
    }

  }

}

