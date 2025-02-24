import 'package:flutter/material.dart';
import 'package:project/features/bookings/screens/bookings_list.dart';
import 'package:project/features/cart/screens/cart.dart';
import 'package:project/features/home/screens/home_screen.dart';
import 'package:project/features/main/widgets/bottom_nav_bar.dart';
import 'package:project/features/profile/screens/main_profile.dart';
import 'package:project/features/search/screens/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const MyBookingScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
