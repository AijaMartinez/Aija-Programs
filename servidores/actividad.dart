
import 'package:http/http.dart' as http;
import 'dart:convert';

class User{
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;
  
  
  User(String jsonString){
    Map<String, dynamic> map = jsonDecode(jsonString);
    this.id = map['id'];
    this.name = map['name'];
    this.username = map['username'];
    this.email = map['email'];
    Map address = map['address'];
    this.address = new Address(address);
    this.phone = map['phone'];
    this.website = map['website'];
    Map company = map['company'];
    this.company = new Company(company);

    

  }
}

class Address{
  String? street;
  String? suite;
  String? city;
  int? zipcode;
  Geo? geo;
  
  Address(Map map){
    this.street = map['street'];
    this.suite = map['suite'];
    this.city = map['city'];
    this.zipcode = map['zipcode'];
    this.geo = new Geo(map['geo']);
    
  }  
}

class Company{
  String? name;
  String? catchPhrase;
  String? bs;
  
  Company(Map map){
    this.name = map['name'];
    this.catchPhrase = map['catchPhrase'];
    this.bs = map['bs'];
  }
}
class Geo{
  String? lat;
  String? lng;
  
  Geo(Map map){
    this.lat = map['lat'];
    this.lng = map['lng'];
  }
}

void main() async {
  int id = 2;
 
  var url = Uri.http('jsonplaceholder.typicode.com', 'users/${id}');
  
  var response = await http.get(url);
  

  if(response.statusCode == 200){
     User user = new User(response.body);
    print(user.name);
  }
}
