class Ticket {
  late int ticketId;
  late String habitacion;
  late String idUser;
  late String nombreHotel;
  late String idHotel;
  late String detalle;
  late String fechaInicio;
  late String fechaFinal;
  late String estado;

  Ticket(
      {required this.ticketId,
      required this.habitacion,
      required this.idUser,
      required this.idHotel,
      required this.nombreHotel,
      required this.detalle,
      required this.fechaInicio,
      required this.fechaFinal,
      required this.estado});

  factory Ticket.desdeJson(Map<String, dynamic> jsonMap) {
    return Ticket(
        ticketId: int.parse(jsonMap['ticketId']),
        habitacion: jsonMap['habitacion'],
        idUser: jsonMap['idUser'],
        idHotel: jsonMap['idHotel'],
        nombreHotel: jsonMap['nombreHotel'],
        detalle: jsonMap['detalle'],
        fechaInicio: jsonMap['fechaInicio'],
        fechaFinal: jsonMap['fechaFinal'],
        estado: jsonMap['estado']);
  }
}
