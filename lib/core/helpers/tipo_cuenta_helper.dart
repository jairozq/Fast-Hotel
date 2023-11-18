class TipoCuentaHelper {
  bool tipoCuentaHotel(String tipo) {
    if (tipo == "H") {
      return true;
    } else {
      return false;
    }
  }

  bool tipoCuentaCliente(String tipo) {
    if (tipo == "C") {
      return true;
    } else {
      return false;
    }
  }

  bool isValidTipoCuenta(String tipo) {
    return tipoCuentaHotel(tipo) && tipoCuentaCliente(tipo);
  }
}
