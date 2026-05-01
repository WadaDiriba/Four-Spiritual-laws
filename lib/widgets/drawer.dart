import 'package:flutter/material.dart';
import 'package:four_laws/book_model.dart';
import 'package:provider/provider.dart';
import 'package:four_laws/constants/app_color.dart';
import 'package:four_laws/screens/detail_screen.dart';
import 'package:four_laws/book_provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  void _navigateToLaw(BuildContext context, Book book) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(book: book)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final books = Provider.of<BookProvider>(context).books;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/laws4.png"),
              ),
            ),
            child: Text(
              "Seerota Hafuuraa Arfan",
              textAlign: TextAlign.center,

              style: TextStyle(
                color: AppColor.light,
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ...books.map(
            (book) => ListTile(
              leading: Icon(Icons.book, color: AppColor.bgoverlay),
              title: Text(book.laws),
              onTap: () => _navigateToLaw(context, book),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info, color: AppColor.bgoverlay),
            title: Text("About"),
            onTap: () {
              // Show about dialog or navigate to about screen
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: AppColor.light,
                  title: Text(
                    " Waa'ee Seerota Hafuuraa Arfan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    "App kun Seerota Hafuuraa Arfan gubbaatti kan xiyyeeffate,dhuga ba'umsaaf baayyee gargaarudha.\n\n© 2026 Developed by Wada Diriba(Sofware Engineer)",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Close",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColor.description,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
