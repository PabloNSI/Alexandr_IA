// PAGINA SECUNDARIA
// Simula un inicio de sesión

import 'package:flutter/material.dart';
import '../data/colores.dart';
import 'library_screen.dart';

class LoadScreen extends StatelessWidget {
  const LoadScreen({super.key});

  @override
  // CÓDIGO VISIBLE PRINCIPAL
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: charcoal,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(flex: 2),
          Image.asset(
            "assets/images/AX1.png",
            width: 200,
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            width: 300,
            child: const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                labelText: 'Email',
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
            child: const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                labelText: 'Password',
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 250,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () => openLibraryScreen(context),
              child:
                  const Text("Log In", style: TextStyle(color: Colors.black)),
            ),
          ),
          const Spacer(flex: 4),
        ]),
      ),
    );
  }

// FUNCIONES

  // Redirecciona a la pagina de library_screen.dart con una transición
  void openLibraryScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LibraryScreen(),
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
}
