import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  User(Map map) {
    this.id = map['id'];
    this.name = map['name'];
    this.username = map['username'];
    this.email = map['email'];
    this.address = new Address(map['address']);
    this.phone = map['phone'];
    this.website = map['website'];
    this.company = new Company(map['company']);
  }
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address(Map map) {
    this.street = map['street'];
    this.suite = map['suite'];
    this.city = map['city'];
    this.zipcode = map['zipcode'];
    this.geo = new Geo(map['geo']);
  }
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company(Map map) {
    this.name = map['name'];
    this.catchPhrase = map['catchPhrase'];
    this.bs = map['bs'];
  }
}

class Geo {
  String? lat;
  String? lng;

  Geo(Map map) {
    this.lat = map['lat'];
    this.lng = map['lng'];
  }
}

void main() async {
  int id = 2;

  var url = Uri.https('jsonplaceholder.typicode.com', 'users/${id}');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    User user = User(jsonResponse);
    print(user.name);
  }
}
