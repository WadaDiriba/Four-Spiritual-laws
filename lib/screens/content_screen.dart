import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:four_laws/book_provider.dart';
import 'package:four_laws/widgets/app_bar.dart';
import 'package:four_laws/widgets/drawer.dart';
import 'package:four_laws/screens/detail_screen.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  void initState() {
    super.initState();
    // Show welcome dialog after widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: CustomAppBar(),
      ),
      drawer: CustomDrawer(),
      body: Consumer<BookProvider>(
        builder: (context, bookProvider, child) {
          return ListView.builder(
            itemCount: bookProvider.books.length,
            itemBuilder: (context, index) {
              final book = bookProvider.books[index];
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(book.title),
                  subtitle: Text(book.laws),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(book: book),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
