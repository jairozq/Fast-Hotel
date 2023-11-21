class Servicios {
  late int id;
  late String nombre;
  late String descripcion;
  late String tiposervicio;
  late String icon;

  Servicios(
      {required this.id,
      required this.nombre,
      required this.descripcion,
      required this.tiposervicio,
      required this.icon});

  factory Servicios.desdeJson(Map<String, dynamic> jsonMap) {
    return Servicios(
        id: jsonMap['id'],
        nombre: jsonMap['nombre'],
        descripcion: jsonMap['descripcion'],
        tiposervicio: jsonMap['tiposervicio'],
        icon: jsonMap['icon']);
  }
}

// Alojamiento
var servicio1 = {
  "id": 1,
  "nombre": "Servicio de limpieza",
  "descripcion": "Servicio de limpieza diario.",
  "tiposervicio": "Habitacion",
  "icon": "assets/services/SLimpieza.png",
};

// Alimentación
var servicio2 = {
  "id": 2,
  "nombre": "Restaurante",
  "descripcion": "Ofrecen desayuno, almuerzo y cena.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SRestaurante.png",
};

var servicio3 = {
  "id": 3,
  "nombre": "Servicio de habitaciones",
  "descripcion": "Comidas y bebidas entregadas en la habitación.",
  "tiposervicio": "Habitacion",
  "icon": "assets/services/SHabitacion.png",
};

var servicio4 = {
  "id": 4,
  "nombre": "Bar y/o cafetería",
  "descripcion": "Acceso al bar y cafeteria del hotel.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SBar.png",
};

// Recepción y Conserjería
var servicio5 = {
  "id": 5,
  "nombre": "Recepción",
  "descripcion": "Recepción las 24 horas.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SRecepcion.png",
};

var servicio6 = {
  "id": 6,
  "nombre": "información y reservas",
  "descripcion":
      "Conserjería para asistir a los huéspedes con información y reservas.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SInformacion.png",
};

// Instalaciones Recreativas
var servicio7 = {
  "id": 7,
  "nombre": "Piscina",
  "descripcion": "Acceso al pisicina del hotel.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SPiscina.png",
};

var servicio8 = {
  "id": 8,
  "nombre": "Gimnasio",
  "descripcion": "Acceso al gimnasio del hotel.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SGimnasio.png",
};

var servicio9 = {
  "id": 9,
  "nombre": "Spa",
  "descripcion": "Acceso al spa del hotel.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SSpa.png",
};

var servicio10 = {
  "id": 10,
  "nombre": "Instalaciones deportivas",
  "descripcion":
      "Acceso a las instalaciones deportivas del hotel como canchas de tenis o golf.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SInstDeportivas.png",
};

// Conferencias y Eventos
var servicio11 = {
  "id": 11,
  "nombre": "Salas de reuniones y conferencias",
  "descripcion": "Acceso a las salas de reuniones y conferencias del hotel.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SSalasR.jpg",
};

var servicio12 = {
  "id": 12,
  "nombre": "Salas de eventos",
  "descripcion":
      "Servicios para eventos especiales (bodas, conferencias, etc.).",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SSalasE.png",
};

// Acceso a Internet
var servicio13 = {
  "id": 13,
  "nombre": "Wi-Fi",
  "descripcion": "Wi-Fi gratuito en las áreas comunes y habitaciones.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SWifi.png",
};

// Entretenimiento
var servicio14 = {
  "id": 14,
  "nombre": "Televisión",
  "descripcion": "La habitación cuenta con televisión por cable o satélite.",
  "tiposervicio": "Habitacion",
  "icon": "assets/services/STV.png",
};

// Transporte
var servicio15 = {
  "id": 15,
  "nombre": "Servicio de transporte",
  "descripcion":
      "Servicio de traslado al aeropuerto o teerminales de trasporte.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/STransporte.png",
};

var servicio16 = {
  "id": 16,
  "nombre": "Estacionamiento",
  "descripcion": "Estacionamiento para huéspedes.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SEstacionamiento.png",
};

// Servicios para Negocios
var servicio17 = {
  "id": 17,
  "nombre": "Papeleria",
  "descripcion": "Centro de negocios con servicios de impresión, fax, etc.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SPapeleria.png",
};

// Seguridad
var servicio18 = {
  "id": 18,
  "nombre": "Seguridad",
  "descripcion": "Servicio de seguridad las 24 horas.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SSeguridad.png",
};

var servicio19 = {
  "id": 19,
  "nombre": "Caja fuerte",
  "descripcion": "Cajas fuertes en las habitaciones.",
  "tiposervicio": "Habitacion",
  "icon": "assets/services/SCaja.png",
};

// Servicios para Niños
var servicio20 = {
  "id": 20,
  "nombre": "Cuidado de niños.",
  "descripcion": "Servicio de cuidado de niños.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SCuidadoN.png",
};

var servicio21 = {
  "id": 21,
  "nombre": "Actividades para niños",
  "descripcion": "Actividades y áreas de juego para niños.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SActividadesN.png",
};

// Mascotas
var servicio22 = {
  "id": 22,
  "nombre": "Mascotas",
  "descripcion": "Alojamiento para mascotas.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SMascotas.png",
};

// Servicios de Lavandería y Limpiabotas
var servicio23 = {
  "id": 23,
  "nombre": "Lavandería",
  "descripcion": "Servicio de lavandería y tintorería.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SLavanteria.png",
};

// Asistencia Médica
var servicio24 = {
  "id": 24,
  "nombre": "Servicios médicos",
  "descripcion": "Servicios médicos de emergencia.",
  "tiposervicio": "Hotel",
  "icon": "assets/services/SMedicos.png",
};

// Otras comodidades
var servicio25 = {
  "id": 25,
  "nombre": "Minibar",
  "descripcion": "Minibar con aperitivos y bebidas.",
  "tiposervicio": "Habitacion",
  "icon": "assets/services/SMinibar.png",
};

var servicio26 = {
  "id": 26,
  "nombre": "Climatización",
  "descripcion": "Control individual de la temperatura en la habitación.",
  "tiposervicio": "Habitacion",
  "icon": "assets/services/SClimatizacion.png",
};

var servicio27 = {
  "id": 27,
  "nombre": "Accesibilidad",
  "descripcion": "Habitaciones adaptadas para personas con discapacidades.",
  "tiposervicio": "Habitacion",
  "icon": "assets/services/SAccesibilidad.png",
};

List<Servicios> servicios = [
  Servicios.desdeJson(servicio1),
  Servicios.desdeJson(servicio2),
  Servicios.desdeJson(servicio3),
  Servicios.desdeJson(servicio4),
  Servicios.desdeJson(servicio5),
  Servicios.desdeJson(servicio6),
  Servicios.desdeJson(servicio7),
  Servicios.desdeJson(servicio8),
  Servicios.desdeJson(servicio9),
  Servicios.desdeJson(servicio10),
  Servicios.desdeJson(servicio11),
  Servicios.desdeJson(servicio12),
  Servicios.desdeJson(servicio13),
  Servicios.desdeJson(servicio14),
  Servicios.desdeJson(servicio15),
  Servicios.desdeJson(servicio16),
  Servicios.desdeJson(servicio17),
  Servicios.desdeJson(servicio18),
  Servicios.desdeJson(servicio19),
  Servicios.desdeJson(servicio20),
  Servicios.desdeJson(servicio21),
  Servicios.desdeJson(servicio22),
  Servicios.desdeJson(servicio23),
  Servicios.desdeJson(servicio24),
  Servicios.desdeJson(servicio25),
  Servicios.desdeJson(servicio26),
  Servicios.desdeJson(servicio27),
];
