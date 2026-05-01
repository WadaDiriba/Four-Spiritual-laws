import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'book_model.dart';

class BookProvider extends ChangeNotifier {
  List<Book> books = [];

  BookProvider() {
    loadBooks();
  }
  Future<void> loadBooks() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/books.json',
      );
      books = Book.fromJsonList(jsonString);
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading books: $e');
    }
  }
}
