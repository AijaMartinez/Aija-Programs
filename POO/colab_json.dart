import 'dart:convert';

class Colaborador {
  String? nombreCompleto;
  int? tipoColaborador;
  double? aporte;

  Colaborador(Map map) {
    this.nombreCompleto = map['nombreCompleto'];
    this.tipoColaborador = map['tipoColaborador'];
    this.aporte = map['aporte'];
  }
}

void main() {
  String colab =
      '{"nombreCompleto": "Charles","tipoColaborador": 1,"aporte": 409.0}';

  Map<String, dynamic> map = jsonDecode(colab);

  Colaborador col = Colaborador(map);
  print(col.nombreCompleto);
  print(col.tipoColaborador);
  print(col.aporte);
}
