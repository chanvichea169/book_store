import 'package:flutter/material.dart';

import '../book_detail/book_detail_screen.dart';
import '../cart/cart_screen.dart';
import '../category/category_screen.dart';
import '../models/book_model.dart';
import '../profile/profile_screen.dart';
import '../saved/saved_screen.dart';
import '../screens/home/home_screen.dart';
import '../search/search_screen.dart';
import 'app_routes.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case AppRoutes.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case AppRoutes.saved:
        return MaterialPageRoute(builder: (_) => const SavedScreen());
      case AppRoutes.bookDetail:
        if (args is Book) {
          return MaterialPageRoute(
            builder: (_) => BookDetailScreen(book: args),
          );
        }
        return _errorRoute();
      case AppRoutes.category:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => CategoryScreen(category: args),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(
          child: Text('Page not found!'),
        ),
      );
    });
  }
}