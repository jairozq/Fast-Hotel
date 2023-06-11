import 'package:fasthotel/data/services/peiticionesResenas.dart';
import 'package:fasthotel/domain/models/resena.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:get/get.dart';

class ControlResena extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<Resena>> _listarResena = Rxn<List<Resena>>([]);

  Future<void> crearResena(
      String idHotel, String resena, String estrellas) async {
    _listarMensajes.value =
        await PeticionesResenas.registrarResena(idHotel, resena, estrellas);
  }

  Future<void> listResenasP(String idHotel) async {
    _listarResena.value = await PeticionesResenas.listarResenaP(idHotel);
    print("2");
  }

  Future<void> listResenasN(String idHotel) async {
    _listarResena.value = await PeticionesResenas.listarResenaN(idHotel);
  }

  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<Resena>? get listarResenas => _listarResena.value;
}
