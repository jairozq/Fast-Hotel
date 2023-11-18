import 'package:fasthotel/core/helpers/registro_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final String registroOk = "Se ha registrado";
  final String registroNo = "No se ha registrado";

  group('La reserva debe ser notificar si fue exitosa', () {
    test("Las reservas exitosas deden devolver mensaje 'Se ha registrado'", () {
      final tipoCuentaHelper = RegistroHelper();
      expect(tipoCuentaHelper.registroExitoso(registroOk), true);
    });

    test(
        "Las reservas no exitosas deden devolver mensaje 'No se ha registrado'",
        () {
      final tipoCuentaHelper = RegistroHelper();
      expect(tipoCuentaHelper.registroExitoso(registroNo), false);
    });
  });

  group('La reserva debe ser notificar si no fue exitosa', () {
    test(
        "Las reservas no exitosas deden devolver mensaje 'No se ha registrado'",
        () {
      final tipoCuentaHelper = RegistroHelper();
      expect(tipoCuentaHelper.registroNoExitoso(registroNo), true);
    });
    test("Las reservas exitosas deden devolver mensaje 'Se ha registrado'", () {
      final tipoCuentaHelper = RegistroHelper();
      expect(tipoCuentaHelper.registroNoExitoso(registroOk), false);
    });
  });
}
