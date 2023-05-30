class Ticket {
  late int ticketId;
  late String habitacion;
  late String idUser;
  late String idHotel;
  late String detalle;
  late DateTime fechaInicio;
  late DateTime fechaFinal;

  Ticket(
      {required this.ticketId,
      required this.habitacion,
      required this.idUser,
      required this.idHotel,
      required this.detalle,
      required this.fechaInicio,
      required this.fechaFinal});

  factory Ticket.desdeJson(Map<String, dynamic> jsonMap) {
    return Ticket(
        ticketId: int.parse(jsonMap['ticketId']),
        habitacion: jsonMap['habitacion'],
        idUser: jsonMap['idUser'],
        idHotel: jsonMap['idHotel'],
        detalle: jsonMap['detalle'],
        fechaInicio: jsonMap['fechaInicio'],
        fechaFinal: jsonMap['fechaFinal']);
  }
}
