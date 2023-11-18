import 'package:fasthotel/data/services/peticionesAccess.dart';
import 'package:fasthotel/data/services/peticionesUser.dart';
import 'package:fasthotel/domain/models/utiles.dart';
import 'package:fasthotel/domain/models/access.dart';
import 'package:fasthotel/domain/models/user.dart';
import 'package:get/get.dart';

class ControlUser extends GetxController {
  final Rxn<List<Mensajes>> _listarMensajes = Rxn<List<Mensajes>>([]);
  final Rxn<List<User>> _listarUser = Rxn<List<User>>([]);
  final Rxn<List<Access>> _listarAccess = Rxn<List<Access>>([]);

  Future<void> crearUser(String nombre, String cedula, String celular,
      String user, String pass) async {
    _listarMensajes.value =
        await PeticionesAccess.registrarAccessUser(cedula, user, pass);
    _listarMensajes.value =
        await PeticionesUser.registrarUser(nombre, cedula, celular);
  }

  Future<void> validarUser(String u, String p) async {
    _listarAccess.value = await PeticionesAccess.validarAccess(u, p);
  }

  Future<void> buscarUser(String id) async {
    _listarUser.value = await PeticionesUser.buscarUser(id);
  }

  List<Mensajes>? get listaMensajes => _listarMensajes.value;
  List<User>? get listaUserLogin => _listarUser.value;
  List<Access>? get listarAccessLogin => _listarAccess.value;
}
