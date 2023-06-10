class Access {
  late String iduser;
  late String user;
  late String pass;
  late String tipocuenta;
  Access({
    required this.iduser,
    required this.user,
    required this.pass,
    required this.tipocuenta,
  });

  factory Access.desdeJson(Map<String, dynamic> jsonMap) {
    return Access(
      iduser: jsonMap['iduser'],
      user: jsonMap['user'],
      pass: jsonMap['pass'],
      tipocuenta: jsonMap['tipocuenta'],
    );
  }
}
