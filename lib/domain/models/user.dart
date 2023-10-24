class User {
  late String nombre;
  late String cedula;
  late String celular;
  late String imagen;

  User({
    required this.nombre,
    required this.cedula,
    required this.celular,
    required this.imagen,
  });

  factory User.desdeJson(Map<String, dynamic> jsonMap) {
    return User(
      nombre: jsonMap['nombre'],
      cedula: jsonMap['cedula'],
      celular: jsonMap['celular'],
      imagen: jsonMap['imagen'],
    );
  }
}
