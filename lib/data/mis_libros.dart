// LISTA DE LIBROS PREDETERMINADOS

import 'package:alexandr_ia/data/iconos.dart';
import 'package:flutter/material.dart';

import '../models/libro.dart';

List<Book> misLibros = [
  Book(
      texto: 'Cien años de soledad',
      categoria: 'Ficción',
      ubicacion: 'Sala de estar, librería',
      icono: const Icon(icono1),
      pagina: 128),
  Book(
      texto: 'El alquimista',
      categoria: 'Novela',
      ubicacion: 'Dormitorio, mesita de noche',
      icono: const Icon(icono2),
      pagina: 0),
  Book(
      texto: 'La sociedad de la nieve',
      categoria: 'Autobiogrfía',
      ubicacion: 'Sala de estar, librería',
      icono: const Icon(icono3),
      pagina: 104),
  Book(
      texto: 'Don Quijote de la Mancha',
      categoria: 'Novela/Sátira',
      ubicacion: 'Sala de estar, librería',
      icono: const Icon(icono4),
      pagina: 1437),
  Book(
      texto: 'Padre Rico, Padre Pobre',
      categoria: 'Finanzas personales',
      ubicacion: 'Sala de estar, librería',
      icono: const Icon(icono5),
      pagina: 26),
  Book(
      texto: 'La sombra del viento',
      categoria: 'Misterio',
      ubicacion: 'Biblioteca, segunda estantería',
      icono: const Icon(icono6),
      pagina: 452),
  Book(
      texto: 'Sapiens: De animales a dioses',
      categoria: 'Historia',
      ubicacion: 'Despacho, escritorio',
      icono: const Icon(icono7),
      pagina: 54),
  Book(
      texto: 'Breves respuestas a las grandes preguntas',
      categoria: 'Ciencia',
      ubicacion: 'Sala de estar, librería',
      icono: const Icon(icono8),
      pagina: 30),
  Book(
      texto: "Harry Potter and the Philosopher's Stone",
      categoria: 'Novela fantástica',
      ubicacion: 'Biblioteca, segunda estantería',
      icono: const Icon(icono9),
      pagina: 187),
  Book(
      texto: "1984",
      categoria: 'Novela política, ficción distópica',
      ubicacion: 'Dormitorio, mesita de noche',
      icono: const Icon(icono10),
      pagina: 348),
  Book(
      texto: "La Guerra de los Mundos",
      categoria: 'Novela, ciencia ficción',
      ubicacion: 'Biblioteca, primera estantería',
      icono: const Icon(icono11),
      pagina: 0),
];
