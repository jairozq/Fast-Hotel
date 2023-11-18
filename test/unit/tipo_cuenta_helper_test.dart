import 'package:fasthotel/core/helpers/tipo_cuenta_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final String tipocuentacliente = "C";
  final String tipocuentahotel = "H";

  group('El login debe dar acceso al hotel al Modulo Hotel', () {
    test('Los usuarios con tipo de cuenta H deben acceder al Modulo Hotel', () {
      final tipoCuentaHelper = TipoCuentaHelper();
      expect(tipoCuentaHelper.tipoCuentaHotel(tipocuentahotel), true);
    });

    test('Los usuarios con tipo de cuenta C no deben acceder al Modulo Hotel',
        () {
      final tipoCuentaHelper = TipoCuentaHelper();
      expect(tipoCuentaHelper.tipoCuentaHotel(tipocuentacliente), false);
    });
  });

  group('El login debe dar acceso al cliente al Modulo Cliente', () {
    test('Los usuarios con tipo de cuenta C deben acceder al Modulo Hotel', () {
      final tipoCuentaHelper = TipoCuentaHelper();
      expect(tipoCuentaHelper.tipoCuentaCliente(tipocuentacliente), true);
    });

    test('Los usuarios con tipo de cuenta H no deben acceder al Modulo Hotel',
        () {
      final tipoCuentaHelper = TipoCuentaHelper();
      expect(tipoCuentaHelper.tipoCuentaCliente(tipocuentahotel), false);
    });
  });
}
