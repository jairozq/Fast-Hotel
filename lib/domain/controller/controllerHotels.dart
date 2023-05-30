import 'package:fasthotel/data/services/PeticionesHoteles.dart';
import 'package:fasthotel/domain/models/hotel.dart';
import 'package:get/get.dart';

class ControlHotels extends GetxController {
  final Rxn<List<Hotel>> _listarHoteles = Rxn<List<Hotel>>([]);

  Future<void> listHotels() async{
    _listarHoteles.value = await PeticionesHotel.listarHoteles();
  }

  List<Hotel>? get listaHoteles => _listarHoteles.value;
}
