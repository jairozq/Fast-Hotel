class Resena {
  late String idHotel;
  late String resena;
  late double estrellas;
  late String fecha;

  Resena({
    required this.idHotel,
    required this.resena,
    required this.estrellas,
    required this.fecha,
  });

  factory Resena.desdeJson(Map<String, dynamic> jsonMap) {
    return Resena(
      idHotel: jsonMap['idHotel'],
      resena: jsonMap['resena'],
      estrellas: double.parse(jsonMap['estrellas']),
      fecha: jsonMap['fecha'],
    );
  }
}
