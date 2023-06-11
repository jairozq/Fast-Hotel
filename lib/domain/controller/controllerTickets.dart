import 'package:fasthotel/data/services/peticionesTickets.dart';
import 'package:fasthotel/domain/models/tickets.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:get/get.dart';

class ControlTicket extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<Ticket>> _listarTickets = Rxn<List<Ticket>>([]);

  Future<void> crearTicket(
    String idUser,
    String nombreHotel,
    String idHotel,
    String detalle,
    String fechaInicio,
    String fechaFinal,
    String habtacion,
  ) async {
    _listarMensajes.value = await PeticionesTicket.registrarTicket(habtacion,
        idUser, nombreHotel, idHotel, detalle, fechaInicio, fechaFinal);
  }

  Future<void> cancelarTickets(String ticketId) async {
    _listarMensajes.value = await PeticionesTicket.cancelarTicket(ticketId);
  }

  Future<void> listTicketsVig(String user) async {
    _listarTickets.value = await PeticionesTicket.listarTicketsVig(user);
  }

  Future<void> listTicketsVen(String user) async {
    _listarTickets.value = await PeticionesTicket.listarTiketsVen(user);
  }

  Future<void> filtrarTickets(String user,idHotel) async {
    _listarTickets.value = await PeticionesTicket.filtrarTickets(user,idHotel);
  }

  Future<void> listTickets(String idHotel) async {
    _listarTickets.value = await PeticionesTicket.listTickets(idHotel);
  }

  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Ticket>? get listarTickets => _listarTickets.value;
}
