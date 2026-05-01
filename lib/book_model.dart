import 'dart:convert';

class Book {
  final String title;
  final String verse;
  final String description;
  final String image;
  final String topic;
  final String laws;

  Book({
    required this.title,
    required this.verse,
    required this.description,
    required this.image,
    required this.topic,
    required this.laws,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      verse: json['verse'],
      description: json['description'],
      image: json['image'],
      topic: json['topic'],
      laws: json['laws'],
    );
  }

  static List<Book> fromJsonList(String jsonString) {
    final List<dynamic> decoded = json.decode(jsonString);
    return decoded.map((item) => Book.fromJson(item)).toList();
  }
}
