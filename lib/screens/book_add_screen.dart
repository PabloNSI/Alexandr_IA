// ESTA PAGINA SERÁ LA C DEL CRUD, CREAR/CREATE
// Servirá para crear un libro con un tiulo, categoria,
// ubicacion, pagina e icono

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/book_provider.dart';
import '../data/colores.dart';
import '../data/iconos.dart';
import '../models/libro.dart';
import 'load_screen.dart';

class BookAddScreen extends StatefulWidget {
  const BookAddScreen({super.key});

  @override
  State<BookAddScreen> createState() => _BookAddScreenState();
}

class _BookAddScreenState extends State<BookAddScreen> {
  // VARIABLES UTILIZADAS
  TextEditingController textoFieldController = TextEditingController();
  TextEditingController categoriaFieldController = TextEditingController();
  TextEditingController ubicacionFieldController = TextEditingController();
  TextEditingController paginaFieldController = TextEditingController();
  String actualDate = DateFormat('dd/MM/yy').format(DateTime.now());
  Icon? selectedIcon;
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
                    controller: paginaFieldController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: 'Pág',
                      labelStyle: TextStyle(color: gris),
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
                  labelText: "Se titula...",
                  labelStyle: TextStyle(color: gris),
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
                  labelText: 'Categoría/descripción del libro...',
                  labelStyle: TextStyle(color: gris),
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
                  labelText: "Dónde esta el libro...",
                  labelStyle: TextStyle(color: gris),
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
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: GestureDetector(
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
                    : const Icon(
                        Icons.add,
                        size: 80,
                      ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => saveBook(context),
        child: const Icon(Icons.save),
      ),
    );
  }

// FUNCIONES
  // Se guarda el libro creado, siendo neceario solo el titulo
  // Se podría relacionar con CREATE en CRUD
  void saveBook(BuildContext context) {
    final bookProvider = context.read<BookProvider>();

    String texto = textoFieldController.text;
    String categoria = categoriaFieldController.text.isNotEmpty
        ? categoriaFieldController.text
        : 'categoria';
    String ubicacion = ubicacionFieldController.text.isNotEmpty
        ? ubicacionFieldController.text
        : 'ubicacion';
    int pagina = paginaFieldController.text.isNotEmpty
        ? int.parse(paginaFieldController.text)
        : 0;

    if (texto.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, ingresa el título del libro'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    bookProvider.addBook(Book(
      texto: texto,
      categoria: categoria,
      ubicacion: ubicacion,
      pagina: pagina,
      icono: selectedIcon!,
    ));

    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Libro agregado'),
        backgroundColor: Colors.green,
      ),
    );
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
