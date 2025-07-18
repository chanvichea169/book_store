import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: AppStyles.heading1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.primary.withOpacity(0.2),
                    child: Icon(Icons.person, size: 40, color: AppColors.primary),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('John Doe', style: AppStyles.heading1),
                      Text('Member since 2023', style: AppStyles.subtitle),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildProfileOption(Icons.history, 'Purchase History'),
            _buildProfileOption(Icons.favorite, 'Wishlist'),
            _buildProfileOption(Icons.settings, 'Settings'),
            _buildProfileOption(Icons.help, 'Help & Support'),
            _buildProfileOption(Icons.logout, 'Logout', isLast: true),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {bool isLast = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: isLast
              ? BorderSide.none
              : BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title),
        trailing: Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}