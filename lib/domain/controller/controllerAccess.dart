import 'package:fasthotel/data/services/peticionesAccess.dart';
import 'package:fasthotel/domain/models/access.dart';
import 'package:get/get.dart';

class ControlAccess extends GetxController {
  final Rxn<List<Access>> _listarAccess = Rxn<List<Access>>([]);

  Future<void> validarAccessUser(String u, String p) async {
    _listarAccess.value = await PeticionesAccess.validarAccess(u, p);
  }
  List<Access>? get listaAccessLogin => _listarAccess.value;
}
