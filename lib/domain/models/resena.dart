class Resena {
  late int idHotel;
  late String resena;
  late double estrellas;

  Resena({
    required this.idHotel,
    required this.resena,
    required this.estrellas,
  });

  factory Resena.desdeJson(Map<String, dynamic> jsonMap) {
    return Resena(
      idHotel: int.parse(jsonMap['idHotel']),
      resena: jsonMap['resena'],
      estrellas: double.parse(jsonMap['estrellas'],)
    );
  }
}
