import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fourspirtuallaws/book_provider.dart';
import 'package:fourspirtuallaws/screens/content_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: MaterialApp(
        title: 'Four Spiritual Laws',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: ContentScreen(),
      ),
    );
  }
}
