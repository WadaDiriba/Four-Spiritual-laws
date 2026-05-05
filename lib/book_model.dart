import 'dart:convert';

class Book {
  final String title;
  final String verse;
  final String description;
  final String image;
  final String topic;
  final String laws;
  final String addverses;
  final String prayer;
  Book({
    required this.title,
    required this.verse,
    required this.description,
    required this.addverses,
    required this.image,
    required this.topic,
    required this.prayer,
    required this.laws,
  });
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      prayer: json['prayer'],
      verse: json['verse'],
      description: json['description'],
      addverses: json['addverses'],
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
