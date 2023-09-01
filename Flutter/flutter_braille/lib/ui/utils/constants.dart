import 'package:flutter/material.dart';

class Constants {
  static String quoteButton = "Pedir una pieza";
  static String quotePartButton = "Cotizar una pieza";

  static String searchingProduct = 'Buscando el producto.';
  static String searchingPiece = 'Buscando la pieza.';
  static String waitingConfirmation = 'Esperando tu confirmación.';
  static String preparingShipment = 'Preparando envío.';
  static String onTheWay = 'En camino.';
  static String pendingPayment = 'Entregado y pendiente de pago.';
  static String paid = 'Entregado y pagado. ';
  static String cancel = 'Cancelada.';
  static String returned = 'Devuelto.';

  static String adminEmail = 'mail@jetz.app';

  static Color orangeColor = const Color(0xffFF9C00);
  static Color yellowColor = const Color(0xffFFCC01);
  static Color purpleColor = const Color(0xff4C2882);
  static Color greenColor = const Color(0xff3AC75E);
  static Color blueColor = const Color(0xff0084FF);
  static Color lightBlueColor = const Color(0xff00b7ee);
  static Color grayColor = const Color(0xff979797);
  static Color grayLightColor = const Color(0xffCAD1D6);
  static Color blackColor = const Color(0xff242424);
  static Color redColor = const Color(0xffFF0000);
  static Color redAlternateColor = const Color(0xFFEE3B33);
  static Color greenLightColor = const Color(0xFF68D58B);
  static Color buttonColor = const Color(0xff00c4ff);
  static Color grayButtonColor = const Color(0xfff2f2f2);
  static Color shadowButtonColor = const Color(0xffD3D3D3);

  static String urlGooglePlay = 'https://play.google.com/store/apps/details?id=app.jetz.commerce';
  static String jetzicaPictureUrl = 'https://cdn.jetz.app/avatars/jetzica-mobile.png';
  static String urlReferral = "https://next.jetz.app/invitacion-referidos";
  static String urlPrivacy = "https://jetz.app/politica-de-privacidad";
  static String tax_record =
      'De acuerdo con los cambios referentes a los Comprobantes Fiscales Digitales por Internet (CFDI) versión 4.0, con fundamento en el Código Fiscal de la Federación 2022 Art. 29-A y Resolución Miscelánea Fiscal para 2022. Se les comunica que será necesario proporcionar su Constancia de Situación Fiscal Actualizada, (la fecha de emisión debe ser no mayor a 30 días de la presente solicitud).';

  static List<String> cfdiItems = [
    'Gastos en general',
    'Adquisición de mercancías',
  ];

  static List<String> genderItems = [
    'Masculino',
    'Femenino',
    'Prefiero no decirlo',
  ];

  static List<Map<String, dynamic>> roleItems = [
    {"name": "Empleado", "value": "1"},
    {"name": "Administrativo de compras", "value": "2"},
    {"name": "Encargado", "value": "3"},
    {"name": "Dueño", "value": "4"}
  ];
  static Map<String, String> spanItems = {
    "1": "1 a 5 autos",
    "2": "5 a 10 autos",
    "3": "10 a 15 autos",
    "4": "15 a 20 autos",
    "5": "20 a 25 autos",
  };
}
