// CLASE BOOK DEFINIDA CON TODOS LAS VARIABLES NECESARIAS

import 'package:flutter/material.dart';

class Book {
  final String texto;
  final String categoria;
  final String ubicacion;
  final int pagina;
  final Icon icono;

  Book(
      {required this.texto,
      required this.categoria,
      required this.ubicacion,
      required this.pagina,
      required this.icono});
}
