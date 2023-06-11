class Resena {
  late String idHotel;
  late String resena;
  late double estrellas;

  Resena({
    required this.idHotel,
    required this.resena,
    required this.estrellas,
  });

  factory Resena.desdeJson(Map<String, dynamic> jsonMap) {
    return Resena(
        idHotel: jsonMap['idHotel'],
        resena: jsonMap['resena'],
        estrellas: double.parse(
          jsonMap['estrellas'],
        ));
  }
}
