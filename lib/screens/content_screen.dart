import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:four_laws/book_provider.dart';
import 'package:four_laws/widgets/app_bar.dart';
import 'package:four_laws/widgets/drawer.dart';
import 'package:four_laws/screens/detail_screen.dart';
import 'package:four_laws/constants/app_color.dart';

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
      _showWelcomeDialog();
    });
  }

  void _showWelcomeDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.light,
        title: Text(
          "Akka Fayyadamu",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.bgoverlay,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kun app Seerota Hafuuraa Arfaniif dha:\n\n",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "1. ☰ Menu aggaa cuqaasi\n2. 📚 Seera filadhu kaasuu\n3. 📖 Qulqullina dubbisuu\n4. 🔙 Duubatti deebi'uuf back button fayyadami\n\n",
              ),
              Text(
                "Seerota Hafuuraa Arfan:\n• Waaqayyo si jaalata\n• Namni Cubbamaadha\n• Yesuus Kiristoos, Karaa Fayyinaati\n• Kiristoos fudhu",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Fayyadama",
              style: TextStyle(
                fontSize: 18,
                color: AppColor.bgoverlay,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
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
          if (bookProvider.books.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
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
