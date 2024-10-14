import 'dart:convert';
import 'package:flutter_app/models/userser.dart';
import 'package:http/http.dart' as http;

class UserServices {
  Future<ActividadModel?> getIdeas(int? id) async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/users/$id');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var actividad = ActividadModel.fromJson(data);
      await Future.delayed(Duration(seconds: 1));
      return actividad;
    } else {
      throw Exception('Error al cargar datos');
    }
  }
}
