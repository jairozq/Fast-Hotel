import 'package:fasthotel/data/services/peticionesHabitaciones.dart';
import 'package:fasthotel/domain/models/habitacion.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:get/get.dart';

class ControlHabitaciones extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<Habitaciones>> _listarHabitaciones =
      Rxn<List<Habitaciones>>([]);

  Future<void> crearHabitacion(String numero, String idhotel) async {
    _listarMensajes.value =
        await PeticionesHabitaciones.crearHabitaciones(numero, idhotel);
  }

  Future<void> cambiarEstadoHabitacion(String estado) async {
    _listarMensajes.value =
        await PeticionesHabitaciones.cambiarEstadoHabitaciones(estado);
  }

  Future<void> listaHabitacion(String idhotel) async {
    _listarHabitaciones.value =
        await PeticionesHabitaciones.listaHabitaciones(idhotel);
  }

  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Habitaciones>? get listarHabitaciones => _listarHabitaciones.value;
}
