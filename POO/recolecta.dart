import 'dart:io';

class Colaborador {
  String? _nombreCompleto;
  int? _tipoColaborador;
  double? _aporte = 0;

  Colaborador(nombre, aporte, tipo) {
    this._nombreCompleto = nombre;
    this._aporte = aporte;
    this._tipoColaborador = tipo;
  }

  String getNombreCompleto() => this._nombreCompleto!;

  int getTipo() => this._tipoColaborador!;

  @override
  String toString() =>
      '{"Nombre": "$_nombreCompleto",  "Aporte": "$_aporte","Tipo": "$_tipoColaborador"}';

  double getAporte() => this._aporte!;
}

class Recolecta {
  List<Colaborador> _colaboradores = [];
  double? _montoRecaudar;
  double? _balance = 0;

  Recolecta(this._montoRecaudar, this._balance);

  addColaborador(Colaborador colaborador) {
    _colaboradores.add(colaborador);
    _balance = _balance! + colaborador.getAporte();
  }

  bool finalizada() => this._balance! >= this._montoRecaudar!;

  List<Colaborador> generosos() {
    List<Colaborador> generosos = [];

    for (var colaborador in _colaboradores) {
      if (colaborador.getAporte() >= 10000) {
        generosos.add(colaborador);
      }
    }
    return generosos;
  }

  double recaudoGenerosos() {
    double total = 0;

    for (var dinero in generosos()) {
      total += dinero.getAporte();
    }

    return total;
  }

  double promedioGenerosos() =>
      this.recaudoGenerosos() / this.generosos().length;

  double recaudoPorTipo(tipo) {
    double recaudo = 0;
    for (var recaTipo in _colaboradores) {
      if (recaTipo.getTipo() == tipo) {
        recaudo += recaTipo.getAporte();
      }
    }
    return recaudo;
  }
}

void main() {
  Recolecta recolecta = Recolecta(20000, 0);

  while (!recolecta.finalizada()) {
    print('Ingrese su nombre: ');
    String nombre = stdin.readLineSync()!;
    print('Ingrese el monto: ');
    double monto = double.parse(stdin.readLineSync()!);
    print('Ingrese el tipo: ');
    int tipo = int.parse(stdin.readLineSync()!);

    Colaborador colaborador1 = Colaborador(nombre, monto, tipo);
    recolecta.addColaborador(colaborador1);
  }

  print('Los generosos son: ${recolecta.generosos()}');
  print('El recaudo por generosos es de: ${recolecta.recaudoGenerosos()}');
  print('El promedio de los generosos es de: ${recolecta.promedioGenerosos()}');
  print('El recaudo por tipo 1 es de: ${recolecta.recaudoPorTipo(1)}');
  print('El recaudo por tipo 2 es de: ${recolecta.recaudoPorTipo(2)}');
}
