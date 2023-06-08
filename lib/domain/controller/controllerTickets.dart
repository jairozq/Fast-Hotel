import 'package:fasthotel/data/services/peticionesTickets.dart';
import 'package:fasthotel/domain/models/tickets.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:get/get.dart';

class ControlTicket extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<Ticket>> _listarTickets = Rxn<List<Ticket>>([]);

  Future<void> crearTicket(
      String habtacion,
      String idUser,
      String nombreHotel,
      String idHotel,
      String detalle,
      String fechaInicio,
      String fechaFinal) async {
    _listarMensajes.value = await PeticionesTicket.registrarTicket(habtacion,
        idUser, nombreHotel, idHotel, detalle, fechaInicio, fechaFinal);
  }

  Future<void> listTicketsVig(String user) async {
    _listarTickets.value = await PeticionesTicket.listarTicketsVig(user);
  }

  Future<void> listTicketVen(String user) async {
    _listarTickets.value = await PeticionesTicket.listarTiketsVen(user);
  }

  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Ticket>? get listarTickets => _listarTickets.value;
}
