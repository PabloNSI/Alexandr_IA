// ESTA PAGINA SERÁ LA R DEL CRUD, LEER/READ
// Servirá para ver los libros que tenemos creados,
// según su icono. Se explica en library_screen.dart
// ESTA PÁGINA TAMBIEN CONTIENE LA D DEL CRUD, ELIMINAR/DELETE

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/book_provider.dart';
import '../data/colores.dart';
import '../data/iconos.dart';
import '../data/mis_libros.dart';
import '../models/libro.dart';
import 'book_add_screen.dart';
import 'book_edit_screen.dart';
import 'load_screen.dart';

class BookScreen extends StatefulWidget {
  final int iconIndex;

  const BookScreen({super.key, required this.iconIndex});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
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
      body: Consumer<BookProvider>(builder: (context, bookProvider, child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            if (bookProvider.books[index].icono.icon ==
                listaIconos[widget.iconIndex].icon) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 200,
                    width: 300,
                    child: ListTile(
                      title: Row(
                        children: [
                          Column(
                            children: [
                              const Spacer(),
                              Icon(
                                misLibros[index].icono.icon,
                                size: 80,
                              ),
                              const Spacer(),
                              Text(misLibros[index].pagina.toString()),
                              const Spacer(),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              const Spacer(
                                flex: 2,
                              ),
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Text(
                                  misLibros[index].texto,
                                  style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 50,
                                width: 100,
                                child: Text(
                                  misLibros[index].ubicacion,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const Spacer(
                                flex: 2,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Spacer(),
                              IconButton(
                                onPressed: () => deleteBook(index),
                                icon: const Icon(Icons.delete),
                                color: const Color.fromARGB(255, 183, 35, 24),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () => openEditScreen(context, index),
                                icon: const Icon(Icons.edit),
                                color: charcoal,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ),
                      onTap: () => openEditScreen(context, index),
                    ),
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          itemCount: misLibros.length,
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: grey,
        onPressed: () => openAddScreen(context),
        child: const Icon(Icons.bookmark_add),
      ),
    );
  }

// FUNCIONES

// Se abre la pagína de crear un libro nuevo
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

// Se abre la página de modificar del libro seleccionado con una transición
// UPDATE en el CRUD
  void openEditScreen(BuildContext context, int posLibroSeleccionado) async {
    Book miLibroActualizado = await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            BookEditScreen(book: misLibros[posLibroSeleccionado]),
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
      misLibros[posLibroSeleccionado] = miLibroActualizado;
    });
  }

// Función de eliminar, se eliminará el libro completo
// DELETE en el CRUD
  void deleteBook(int posicionLibroAEliminar) {
    setState(() {
      misLibros.removeAt(posicionLibroAEliminar);
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
