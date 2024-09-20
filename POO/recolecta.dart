import 'dart:io';

class Colaborador {
  String? _nombreCompleto;
  int? _tipoColaborador;
  double _aporte = 0;

  Colaborador(this._nombreCompleto, this._aporte, this._tipoColaborador);

  String getNombreCompleto() => _nombreCompleto!;

  int getTipo() => _tipoColaborador!;

  @override
  String toString() =>
      '{"Nombre": "$_nombreCompleto",  "Aporte": "$_aporte","Tipo": "$_tipoColaborador"}';

  double getAporte() => _aporte;
}

class Recolecta {
  List<Colaborador> _colaboradores = [];
  double? _montoRecaudar;
  double? _balance = 0;

  Recolecta(this._montoRecaudar, [this._balance]);

  addColaborador(Colaborador colaborador) {
    _colaboradores.add(colaborador);
    _balance = _balance! + colaborador.getAporte();
  }

  bool finalizada() => _balance! > _montoRecaudar!;

  List<Colaborador> generosos() {
    List<Colaborador> generososList = [];
    for (var colaborador in _colaboradores) {
      if (colaborador.getAporte() >= 10000) {
        generososList.add(colaborador);
      }
    }

    return generososList;
  }

  double recaudoGenerosos() {
    double total = 0;

    for (var dinero in generosos()) {
      total += dinero.getAporte();
    }

    return total;
  }

  double promedioGenerosos() => _balance! / _montoRecaudar!;

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
