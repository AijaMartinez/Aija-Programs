import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
 var url = Uri.https('jsonplaceholder.typicode.com', 'posts/1');
 var response  = await http.get(url);
  
  String infUser = '{"postId": 1,"id": 1,"name": "Charles","email": "charle@gmail.com","body": " JEJEJE SIUUU"}';
  

  Map<String, Uri> map = jsonDecode(infUser);
  User user = User(map);

  print('Response status: ${response.statusCode}');
  print('Response name: ${user.name}');
  print('Respose id: ${user.id}');
  print('Respose email: ${user.email}');
  print('Response body: ${user.body}');

  
  
}

class User{
  int? postId;
  int? id;
  String? name;
  var email;
  String? body;
  
  User(Map map){
    this.postId = map['postId'];
    this.id = map['id'];
    this.name = map['name'];
    this.email = map['email'];
    this.body = map['body'];
  
  }
  
}
