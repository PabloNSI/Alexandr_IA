import 'package:flutter/material.dart';
import 'dart:math';

// LISTA DE COLORES USADOS COMO PAELTA DE LA APLICACIÓN

const Color primary = Color.fromARGB(255, 12, 24, 33);
const Color black = Color(0xff000000);
const Color blue = Color.fromARGB(255, 27, 42, 65);
const Color charcoal = Color.fromARGB(255, 67, 102, 133);
const Color grey = Color.fromARGB(255, 211, 208, 226);
const Color gris = Color(0xff63696D);

// LISTA DE COLORES ALEATORIOS COMO DECORACIÓN DE LA BIBLIOTECA

const Color claro0 = Color.fromARGB(255, 224, 165, 165);
const Color claro1 = Color.fromARGB(255, 213, 183, 146);
const Color claro2 = Color.fromARGB(255, 213, 201, 146);
const Color claro3 = Color.fromARGB(255, 158, 198, 130);
const Color claro10 = Color.fromARGB(255, 156, 224, 204);
const Color claro4 = Color.fromARGB(255, 171, 210, 220);
const Color claro5 = Color.fromARGB(255, 184, 176, 221);
const Color claro6 = Color.fromARGB(255, 195, 152, 191);
const Color claro7 = Color.fromARGB(255, 234, 195, 218);
const Color claro8 = Color.fromARGB(255, 226, 158, 165);
const Color claro9 = Color.fromARGB(255, 182, 180, 180);
const Color claro11 = Color.fromARGB(255, 255, 255, 255);

List<Color> usedColors = [];

Color getRandomColor() {
  final colors = [
    claro0,
    claro1,
    claro2,
    claro3,
    claro4,
    claro5,
    claro6,
    claro7,
    claro8,
    claro9,
    claro10,
    claro11
  ];

  Color randomColor;
  int randomIndex;
  if (usedColors.length == colors.length) {
    usedColors.clear();
  }
  do {
    randomIndex = Random().nextInt(colors.length);
  } while (usedColors.contains(colors[randomIndex]));

  randomColor = colors[randomIndex];
  usedColors.add(randomColor);

  return randomColor;
}
