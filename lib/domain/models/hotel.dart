class Hotel {
  late String direccion;
  late String nombre;
  late String descripcion;
  late int habitaciones;
  late String imagen;

  Hotel(
      {required this.direccion,
      required this.nombre,
      required this.descripcion,
      required this.habitaciones,
      required this.imagen});

  factory Hotel.desdeJson(Map<String, dynamic> jsonMap) {
    return Hotel(
      direccion: jsonMap['direccion'],
      nombre: jsonMap['nombre'],
      descripcion: jsonMap['descripcion'],
      habitaciones: int.parse(jsonMap['nhabitaciones']),
      imagen: jsonMap['imagen'],
    );
  }
}
