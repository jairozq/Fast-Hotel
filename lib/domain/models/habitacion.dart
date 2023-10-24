class Habitaciones {
  late String numero;
  late String idhotel;
  late String servicios;
  late String foto;
  late String foto2;
  late String foto3;
  late String estado;

  Habitaciones({
    required this.numero,
    required this.idhotel,
    required this.servicios,
    required this.foto,
    required this.foto2,
    required this.foto3,
    required this.estado,
  });

  factory Habitaciones.desdeJson(Map<String, dynamic> jsonMap) {
    return Habitaciones(
      numero: (jsonMap['numero']),
      idhotel: jsonMap['idhotel'],
      servicios: jsonMap['servicios'],
      foto: jsonMap['foto'],
      foto2: jsonMap['foto2'],
      foto3: jsonMap['foto3'],
      estado: jsonMap['estado'],
    );
  }
}
