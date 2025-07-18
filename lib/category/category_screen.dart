import 'package:flutter/material.dart';

import '../constants/app_styles.dart';
import '../models/book_model.dart';
import '../routes/app_routes.dart';
import '../screens/home/widgets/featured_book_card.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category, style: AppStyles.heading1),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(16),
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: List.generate(10, (index) {
          final book = Book(
            id: '$index',
            title: '$category Book ${index + 1}',
            author: 'Author Name',
            price: 12.99 + index,
            category: category,
            rating: 4.0 + (index * 0.1),
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
            child: FeaturedBookCard(book: book),
          );
        }),
      ),
    );
  }
}