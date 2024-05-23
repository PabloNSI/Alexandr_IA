// PROVIDER para mejorar la gestión de datos entre pantallas

import 'package:flutter/material.dart';
import '../data/mis_libros.dart';
import '../models/libro.dart';

class BookProvider extends ChangeNotifier {
  final List<Book> _books = misLibros;

  List<Book> get books => _books;

  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }

  void updateBook(int index, Book updatedBook) {
    _books[index] = updatedBook;
    notifyListeners();
  }

  void deleteBook(int index) {
    _books.removeAt(index);
    notifyListeners();
  }
}
