//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
//import 'package:sendgrid_mailer/sendgrid_mailer.dart';

class EmailHelper {
  bool format(String email) {
    if (email.contains(RegExp('@'))) {
      if (email.contains('.')) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool exist(String email) {
    if (format(email)) {
      return true;
    } else {
      return false;
    }
    /*late bool respuesta;
    print("object");
    final mailer = Mailer(
        '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');
    final toAddress = Address('jairosalasvillazon@gmail.com');
    final fromAddress = Address('jairosalasvillazon@gmail.com');
    final content =
        Content('text/plain', 'Hola su curreo fue verificado correctamente');
    final subject = 'Fast Hotel';
    final personalization = Personalization([toAddress]);

    final emails =
        Email([personalization], fromAddress, subject, content: [content]);
    mailer.send(emails).then((result) {
      print(result.isValue);
      respuesta = result.isValue;
    });
    print(respuesta);
    return respuesta;*/
  }

  bool isValidEmail(String email) {
    return format(email) && exist(email);
  }
}
