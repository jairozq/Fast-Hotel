import 'package:fasthotel/core/helpers/email_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final String goodEmail = "jairosalasvillazon@gmail.com";

  group('El email debe contener un @ y almenos un .', () {
    test('emails con almenos un . o y un @ son validos', () {
      final emaildHelper = EmailHelper();
      expect(emaildHelper.format(goodEmail), true);
    });

    test('emails sin almenos un . o sin un @ no son validos', () {
      final emaildHelper = EmailHelper();
      expect(emaildHelper.format("ejemplogmail.com"), false);
    });
  });

  group('El email debe existir', () {
    test('emails existentes son validas', () {
      final emaildHelper = EmailHelper();
      expect(emaildHelper.exist(goodEmail), true);
    });

    test('emails no existentes no son validas', () {
      final emaildHelper = EmailHelper();
      expect(emaildHelper.exist("ejemplo@gmailcom"), false);
    });
  });
}
