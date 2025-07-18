import 'package:flutter/material.dart';

import '../constants/app_styles.dart';
import '../models/book_model.dart';
import '../routes/app_routes.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Items', style: AppStyles.heading1),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(16),
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: List.generate(6, (index) {
          final book = Book(
            id: '$index',
            title: 'Saved Book ${index + 1}',
            author: 'Author Name',
            price: 12.99,
            category: 'Fiction',
            rating: 4.0,
            coverUrl: 'assets/placeholder.jpg',
          );
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.bookDetail,
                arguments: book,
              );
            },
            // child: FeaturedBookCard(book: book),
          );
        }),
      ),
    );
  }
}