import 'package:flutter/material.dart';


import '../constants/app_colors.dart';
import '../models/book_model.dart';
import '../routes/app_routes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search books, authors...',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: AppColors.secondary),
              contentPadding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with actual search results
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.book, color: AppColors.primary),
            title: Text('Search Result ${index + 1}'),
            subtitle: Text('Author Name'),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.bookDetail,
                arguments: Book(
                  id: '$index',
                  title: 'Search Result ${index + 1}',
                  author: 'Author Name',
                  price: 12.99,
                  category: 'Fiction',
                  rating: 4.0,
                  coverUrl: 'https://covers.openlibrary.org/b/id/10523345-L.jpg',
                ),
              );
            },
          );
        },
      ),
    );
  }
}