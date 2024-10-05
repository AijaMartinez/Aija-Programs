import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  int? userId;
  int? id;
  String? title;
  String? body;

  User(Map map) {
    this.userId = map['userId'];
    this.id = map['id'];
    this.title = map['title'];
    this.body = map['body'];
  }
}

void main() async {
  var url = Uri.https('jsonplaceholder.typicode.com', 'posts');
  var response = await http.post(
    url,
    body: jsonEncode(
        {'userId': 1, 'id': 1, 'title': 'HI', 'body': 'DO I KNOW YOU?'}),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 201) {
    Map<String, dynamic> json = jsonDecode(response.body);
    User user = User(json);
    print(user.title);
    print(user.body);
  }
}
