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
