// PAGINA SECUNDARIA
// Facilita la gestión de los libros a través de una estanteria virtual
// En cierta parte cumple la R del CRUD, READ/LEER

import 'package:alexandr_ia/data/iconos.dart';
import 'package:alexandr_ia/screens/book_screen.dart';
import 'package:flutter/material.dart';
import '../data/colores.dart';
import '../data/mis_libros.dart';
import '../models/libro.dart';
import 'book_add_screen.dart';
import 'load_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  // CÓDIGO VISIBLE PRINCIPAL
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: charcoal,
      appBar: AppBar(
        backgroundColor: charcoal,
        centerTitle: true,
        title: SizedBox(
          width: 200,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: grey,
            ),
            onPressed: () => openLoadScreen(context),
            child: const Text("Log Out", style: TextStyle(color: black)),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView(
              children: [
                ...List.generate(listaIconos.length, (index) {
                  return Center(
                    child: Row(
                      children: [
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.brown.shade700,
                            border: const Border(
                              top: BorderSide(
                                  width: 15,
                                  color: Color.fromARGB(255, 91, 63, 55)),
                              bottom: BorderSide(
                                  width: 15,
                                  color: Color.fromARGB(255, 91, 63, 55)),
                              left: BorderSide(
                                  width: 20,
                                  color: Color.fromARGB(255, 91, 63, 55)),
                              right: BorderSide(
                                  width: 20,
                                  color: Color.fromARGB(255, 91, 63, 55)),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                color: Colors.black,
                                width: 251,
                                height: 10,
                              ),
                              Container(
                                color: getRandomColor(),
                                width: 250,
                                height: 70,
                                child: IconButton(
                                  onPressed: () =>
                                      openBookScreen(context, index),
                                  icon: listaIconos[index],
                                  iconSize: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  );
                }),
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      width: 291,
                      height: 3,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    const Spacer(),
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      width: 291,
                      height: 100,
                      color: const Color.fromARGB(255, 91, 63, 55),
                      child: Image.asset(
                        "assets/images/AX_brown.png",
                        width: 15,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      width: 291,
                      height: 15,
                      color: const Color.fromARGB(255, 91, 63, 55),
                    ),
                    const Spacer(),
                  ],
                ),
                Container(
                  height: 20,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 138, 100, 66),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: grey,
        onPressed: () => openAddScreen(context),
        child: const Icon(Icons.bookmark_add),
      ),
    );
  }

// FUNCIONES

// Se redirecciona a la página de los libros segun su icono con una transición
  void openBookScreen(BuildContext context, int iconIndex) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            BookScreen(iconIndex: iconIndex),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

// Se abre la pagína de crear un libro nuevo con una transición
// CREATE en el CRUD
  void openAddScreen(BuildContext context) async {
    Book nuevoLibro = await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const BookAddScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );

    setState(() {
      misLibros.add(nuevoLibro);
    });
  }

  // Función para redireccionar a la pantalla de inicio con una transición
  void openLoadScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoadScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(-1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }
}
