import 'package:fasthotel/data/services/peticionesServicios.dart';
import 'package:fasthotel/domain/models/servicios.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:get/get.dart';

class ControlServicios extends GetxController {
  final Rxn<List<Servicios>> _listarServiciosL = Rxn<List<Servicios>>([]);
  final Rxn<List<Servicios>> _listarServicios = Rxn<List<Servicios>>([]);
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);

  Future<void> agregarServicios(
      String numero, String idhotel, String listservices) async {
    _listarMensajes.value = await PeticionesServicios.agregarServicios(
        numero, idhotel, listservices);
  }

  Future<void> listarServicios(String numero, String idhotel) async {
    _listarServicios.value =
        await PeticionesServicios.listarServicios(numero, idhotel);
  }

  @override
  void onInit() {
    _listarServiciosL.value = servicios;
    super.onInit();
  }

  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Servicios>? get listaServicios => _listarServicios.value;
  List<Servicios>? get listarServiciosL => _listarServiciosL.value;
}
