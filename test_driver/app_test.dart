import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("test login", () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver!.close();
      }
    });

    final logClient = find.text("     Entrar     ");
    final reservar = find.text("Resevar");

    test("cuando el logueo es como cliente", () async {
      await driver!.waitFor(logClient);
      await driver!.tap(logClient);
      await driver!.waitFor(reservar);
      await driver!.tap(reservar);
    });
  });
}
