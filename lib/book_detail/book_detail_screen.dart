import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';
import '../models/book_model.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                book.coverUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: Colors.grey[200]),
              ),
            ),
            pinned: true,
            actions: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title, style: AppStyles.heading1),
                  SizedBox(height: 8),
                  Text('by ${book.author}', style: AppStyles.bookAuthor),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.rating, size: 20),
                      SizedBox(width: 4),
                      Text('${book.rating}', style: AppStyles.bookAuthor),
                      SizedBox(width: 16),
                      Icon(Icons.category, color: Colors.grey, size: 20),
                      SizedBox(width: 4),
                      Text(book.category, style: AppStyles.bookAuthor),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This is a detailed description of the book. It would contain information about the plot, the author, and other relevant details that might interest a potential reader.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${book.price}',
                        style: AppStyles.bookPrice.copyWith(fontSize: 24),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}