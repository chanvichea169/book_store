import 'package:flutter/material.dart';
import 'package:work1/screens/home/widgets/category_card.dart';
import 'package:work1/screens/home/widgets/featured_book_card.dart';
import 'package:work1/screens/home/widgets/section_header.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';
import '../../models/book_model.dart';

class HomeScreen extends StatelessWidget {
  final List<Book> featuredBooks = [
    Book(
      id: '1',
      title: 'The Midnight',
      author: 'Matt Haig',
      price: 14.99,
      category: 'Fiction',
      rating: 4.5,
      coverUrl: 'https://covers.openlibrary.org/b/id/10523345-L.jpg',
    ),
    Book(
      id: '2',
      title: 'Atomic Habits',
      author: 'James Clear',
      price: 11.99,
      category: 'Self-Help',
      rating: 4.7,
      coverUrl: 'https://covers.openlibrary.org/b/id/11102286-L.jpg',
    ),
    Book(
      id: '3',
      title: 'Dune',
      author: 'Frank Herbert',
      price: 13.99,
      category: 'Sci-Fi',
      rating: 4.8,
      coverUrl: 'https://covers.openlibrary.org/b/id/8101351-L.jpg',

    ),
    Book(
      id: '4',
      title: 'Educated',
      author: 'Tara Westover',
      price: 12.99,
      category: 'Biography',
      rating: 4.6,
      coverUrl: 'https://covers.openlibrary.org/b/id/10424041-L.jpg',
    ),
  ];

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.auto_stories, 'label': 'Fiction', 'color': Colors.purple},
    {'icon': Icons.school, 'label': 'Education', 'color': Colors.blue},
    {'icon': Icons.science, 'label': 'Science', 'color': Colors.teal},
    {'icon': Icons.people, 'label': 'Biography', 'color': Colors.orange},
    {'icon': Icons.history, 'label': 'History', 'color': Colors.red},
    {'icon': Icons.child_friendly, 'label': 'Children', 'color': Colors.pink},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeSection(),
              const SizedBox(height: 28),
              _buildPromoBanner(),
              const SizedBox(height: 28),
              SectionHeader(title: 'Featured Books', onSeeAll: _viewAllFeatured),
              const SizedBox(height: 14),
              SizedBox(
                height: 280,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredBooks.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 20),
                  itemBuilder: (context, index) => _buildFeaturedBookCard(featuredBooks[index]),
                ),
              ),
              const SizedBox(height: 40),
              SectionHeader(title: 'Categories', onSeeAll: _viewAllCategories),
              const SizedBox(height: 18),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) => _buildCategoryCard(
                  categories[index]['icon'],
                  categories[index]['label'],
                  categories[index]['color'],
                ),
              ),
              const SizedBox(height: 40),
              SectionHeader(title: 'New Arrivals', onSeeAll: _viewAllNewArrivals),
              const SizedBox(height: 14),
              SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredBooks.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 20),
                  itemBuilder: (context, index) => _buildNewArrivalCard(featuredBooks[index]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildWelcomeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello,', style: AppStyles.subtitle.copyWith(color: Colors.grey.shade700)),
            const SizedBox(height: 6),
            Text('Bookworm!', style: AppStyles.heading1.copyWith(fontSize: 32, color: Colors.black87)),
          ],
        ),
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.purple.shade100,
          child: IconButton(
            icon: Icon(Icons.notifications_outlined, size: 26, color: Colors.purple.shade700),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [Colors.purple.shade600, Colors.purple.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('SUMMER SALE', style: AppStyles.promoSubtitle.copyWith(color: Colors.white70, letterSpacing: 2)),
                const SizedBox(height: 6),
                Text('30% OFF', style: AppStyles.promoTitle.copyWith(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('On selected fiction books', style: AppStyles.promoText.copyWith(color: Colors.white70)),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.purple.shade700,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  onPressed: _viewPromoBooks,
                  child: const Text('Shop Now', style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://covers.openlibrary.org/b/id/10523345-L.jpg',
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedBookCard(Book book) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with rounded corners and shadow
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              book.coverUrl,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress == null ? child : Container(
                height: 180,
                color: Colors.grey.shade300,
                child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              errorBuilder: (context, error, stackTrace) => Container(
                height: 180,
                color: Colors.grey.shade300,
                child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.bookTitle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    )),
                const SizedBox(height: 6),
                Text(book.author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.bookAuthor.copyWith(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    )),
                const SizedBox(height: 8),
                Text(
                  '\$${book.price.toStringAsFixed(2)}',
                  style: AppStyles.bookPrice.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.green.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(IconData icon, String label, Color color) {
    return InkWell(
      onTap: () => _viewCategory(label),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.6),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: color.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 6)),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.7,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewArrivalCard(Book book) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.network(
              book.coverUrl,
              width: double.infinity,
              height: 140,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress == null ? child : Container(
                height: 140,
                color: Colors.grey.shade300,
                child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              errorBuilder: (context, error, stackTrace) => Container(
                height: 140,
                color: Colors.grey.shade300,
                child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              book.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.bookTitle.copyWith(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              book.author,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.purple.shade700,
      unselectedItemColor: Colors.grey.shade600,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 8,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'Browse'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_outline), label: 'Saved'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
      onTap: _onNavItemTapped,
    );
  }

  void _viewAllFeatured() {
    // TODO: implement navigation or logic
  }

  void _viewAllCategories() {
    // TODO: implement navigation or logic
  }

  void _viewAllNewArrivals() {
    // TODO: implement navigation or logic
  }

  void _viewCategory(String category) {
    // TODO: implement navigation or logic
  }

  void _viewPromoBooks() {
    // TODO: implement navigation or logic
  }

  void _onNavItemTapped(int index) {
    // TODO: implement navigation logic
  }
}
