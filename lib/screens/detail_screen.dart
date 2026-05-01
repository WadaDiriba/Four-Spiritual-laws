import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:four_laws/book_model.dart';
import 'package:four_laws/book_provider.dart';
import 'package:four_laws/constants/app_color.dart';
import 'package:four_laws/widgets/drawer.dart';

class DetailScreen extends StatefulWidget {
  final Book book;
  const DetailScreen({super.key, required this.book});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 80,

        backgroundColor: AppColor.bgoverlay,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text(
          'Seerota Afuura Arfan',
          style: TextStyle(
            color: AppColor.light,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'regular',
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          DropdownMenu<String>(
            controller: TextEditingController(),
            hintText: 'Select a law',
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 'Seera tokkoffaa', label: 'Law 1'),
              DropdownMenuEntry(value: 'Seera lammaffaa', label: 'Law 2'),
              DropdownMenuEntry(value: 'Seera sadaffaa', label: 'Law 3'),
              DropdownMenuEntry(value: 'Seera afuraffaa', label: 'Law 4'),
            ],
            onSelected: (value) {
              if (value != null) {
                // Navigate to the selected law
                _navigateToLaw(context, value);
              }
            },
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: AppColor.bgoverlay.withValues(alpha: 0.5),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              //color: AppColor.bgoverlay.withValues(alpha: 0.2),
              child: Center(
                child: Text(
                  widget.book.laws,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.light,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.book.title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Text(
                widget.book.verse,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.verse,
                ),
              ),
            ),

            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.book.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 24),
            Text(
              widget.book.description,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 24),
            Text(
              'Topic: ${widget.book.topic}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToLaw(BuildContext context, String lawName) {
    final bookProvider = Provider.of<BookProvider>(context, listen: false);
    final selectedBook = bookProvider.books.firstWhere(
      (book) => book.laws == lawName,
      orElse: () => widget.book,
    );

    if (selectedBook.laws != widget.book.laws) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(book: selectedBook),
        ),
      );
    }
  }
}
