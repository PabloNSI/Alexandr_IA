// ESTA PAGINA SERÁ LA U DEL CRUD, ACTUALIZAR/UPDATE
// Servirá para actualizar el libro seleccioando con
// un tiulo, categoria, ubicacion, pagina e icono.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/book_provider.dart';
import '../data/colores.dart';
import '../data/iconos.dart';
import '../models/libro.dart';
import 'load_screen.dart';

class BookEditScreen extends StatefulWidget {
  const BookEditScreen({super.key, required this.book});
  final Book book;
  @override
  State<BookEditScreen> createState() => _BookEditScreenState();
}

class _BookEditScreenState extends State<BookEditScreen> {
  // VARIABLES UTILIZADAS
  TextEditingController textoFieldController = TextEditingController();
  TextEditingController categoriaFieldController = TextEditingController();
  TextEditingController ubicacionFieldController = TextEditingController();
  TextEditingController paginaFieldController = TextEditingController();
  Icon? selectedIcon;
  String actualDate = DateFormat('dd/MM/yy').format(DateTime.now());

  @override
  void initState() {
    super.initState();
// VARIABLES PARA ALMACENAR DATOS Y ACTUALIZARLOS
    textoFieldController.text = widget.book.texto;
    categoriaFieldController.text = widget.book.categoria;
    ubicacionFieldController.text = widget.book.ubicacion;
    paginaFieldController.text = widget.book.pagina.toString();
  }

  @override
  // CÓDIGO VISIBLE PRINCIPAL
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                const Text(
                  "CONTENIDO",
                  style: TextStyle(fontSize: 35, color: grey),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: 60,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: paginaFieldController,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              width: 300,
              child: TextField(
                controller: textoFieldController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primary),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              width: 300,
              child: TextField(
                controller: categoriaFieldController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primary),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              width: 300,
              child: TextField(
                controller: ubicacionFieldController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primary),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ),
            const Spacer(),
            const Text(
              "FECHA DE CREACIÓN",
              style: TextStyle(fontSize: 25, color: grey),
            ),
            Text(
              actualDate,
              style: const TextStyle(fontSize: 25, color: grey),
            ),
            const Spacer(),
            Center(
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
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SingleChildScrollView(
                                    child: Column(
                                      children: listaIconos.map((Icon icon) {
                                        return ListTile(
                                          title: icon,
                                          onTap: () {
                                            setState(() {
                                              selectedIcon = icon;
                                            });
                                            Navigator.pop(context);
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  );
                                },
                              );
                            },
                            child: selectedIcon != null
                                ? Icon(
                                    selectedIcon!.icon,
                                    size: 80,
                                  )
                                : Icon(
                                    widget.book.icono.icon,
                                    size: 80,
                                  ),
                          ),
                          const SizedBox(height: 16),
                          Text(paginaFieldController.text),
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
                              textoFieldController.text,
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
                              ubicacionFieldController.text,
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
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Spacer(),
                          Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 183, 35, 24),
                          ),
                          Spacer(),
                          Icon(
                            Icons.edit,
                            color: charcoal,
                          ),
                          Spacer(),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: grey,
        onPressed: () => saveBook(context),
        child: const Icon(Icons.save),
      ),
    );
  }

// FUNCIONES
// Se guardan los cambios del libro
// UPDATE en el CRUD
  void saveBook(BuildContext context) {
    final bookProvider = context.read<BookProvider>();

    String texto = textoFieldController.text;
    String categoria = categoriaFieldController.text;
    String ubicacion = ubicacionFieldController.text;
    int pagina = int.parse(paginaFieldController.text);
    Icon icono = selectedIcon ?? widget.book.icono;

    Book miNuevoLibro = Book(
      texto: texto,
      categoria: categoria,
      ubicacion: ubicacion,
      pagina: pagina,
      icono: icono,
    );

    bookProvider.updateBook(
        bookProvider.books.indexOf(widget.book), miNuevoLibro);

    Navigator.of(context).pop(miNuevoLibro);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Libro modificado'),
      backgroundColor: Colors.green,
    ));
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
