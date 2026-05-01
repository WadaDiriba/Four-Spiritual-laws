import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:four_laws/book_provider.dart';
import 'package:four_laws/screens/content_screen.dart';

void main() {
  runApp(const FourLawsApp());
}

class FourLawsApp extends StatelessWidget {
  const FourLawsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookProvider(),
      child: MaterialApp(
        title: 'Seerota Hafuuraa Arfan',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: ContentScreen(),
      ),
    );
  }
}
