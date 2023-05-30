class User {
  late String nombre;
  late String cedula;
  late String celular;
  late String user;
  late String password;

  User(
      {required this.nombre,
      required this.cedula,
      required this.celular,
      required this.user,
      required this.password});

  factory User.desdeJson(Map<String, dynamic> jsonMap) {
    return User(
        nombre: jsonMap['nombre'],
        cedula: jsonMap['cedula'],
        celular: jsonMap['celular'],
        user: jsonMap['email'],
        password: jsonMap['pass']);
  }
}
