class RegistroHelper {
  bool registroExitoso(String registro) {
    if (registro == "Se ha registrado") {
      return true;
    } else {
      return false;
    }
  }

  bool registroNoExitoso(String registro) {
    if (registro == "No se ha registrado") {
      return true;
    } else {
      return false;
    }
  }

  bool isValidTipoCuenta(String tipo) {
    return registroExitoso(tipo) && registroNoExitoso(tipo);
  }
}
