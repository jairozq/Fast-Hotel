import 'package:fasthotel/data/services/PeticionesHoteles.dart';
import 'package:fasthotel/data/services/peticionesAccess.dart';
import 'package:fasthotel/domain/models/hotel.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:get/get.dart';

class ControlHotel extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<Hotel>> _listarHotel = Rxn<List<Hotel>>([]);

  Future<void> crearHotel(String nombre, String direccion, String descripcion,
      String habitaciones, String? foto, String user, String pass) async {
    _listarMensajes.value = await PeticionesHotel.registrarHotel(
        nombre, direccion, descripcion, habitaciones, foto);
    _listarMensajes.value =
        await PeticionesAccess.registrarAccessHotel(direccion, user, pass);
  }

  Future<void> validarHotel(String user, String pass) async {
    _listarHotel.value = await PeticionesHotel.validarHotel(user, pass);
  }

  Future<void> listHotels() async {
    _listarHotel.value = await PeticionesHotel.listarHoteles();
  }

  Future<void> filterHotels(String nombre) async {
    _listarHotel.value = await PeticionesHotel.filtrarHoteles(nombre);
  }

  Future<void> searchHotels(String idhotel) async {
    _listarHotel.value = await PeticionesHotel.buscarHoteles(idhotel);
  }

  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Hotel>? get listarHotel => _listarHotel.value;
}
