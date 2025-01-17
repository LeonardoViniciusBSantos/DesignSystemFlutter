import 'package:develop_design_system/DesignSystem/Components/BottomTabBar/bottom_tab_bar.dart';
import 'package:develop_design_system/DesignSystem/Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import 'package:develop_design_system/DesignSystem/shared/styles.dart';
import 'package:develop_design_system/Scenes/Profile/profile_router.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final List<String> functions = [
    'Edit Name',
    'Shipping Info',
    'Notification',
    'Terms & Conditions',
  ];

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        titleTextStyle: const TextStyle(
          fontFamily: 'Inter',
          color: Colors.black,
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
        titleSpacing: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 32),
            ...functions.map((name) => _buildFunctionItem(name)).toList(),
            _buildLogoutButton(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomTabBar.instantiate(
        currentIndex: 3,
        viewModel: BottomTabBarViewModel(
          bottomTabs: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Messages"),
            BottomNavigationBarItem(icon: Icon(Icons.label), label: "Label"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.asset('AvatarProfile.png', fit: BoxFit.cover),
          ),
          const SizedBox(width: 8),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Amanda Doe',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'amanda@gmail.com',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFunctionItem(String name) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: paragraph1Regular),
          const Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () => ProfileRouter.navigateToLogin(context),
        child: Text(
          'Logout',
          style: paragraph1Regular.copyWith(color: Colors.red),
        ),
      ),
    );
  }
}
