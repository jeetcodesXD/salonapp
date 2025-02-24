import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: const Color(0xFF002B5B),
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 24),
        onTap: onTabSelected,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedIndex == 0
                  ? 'assets/icons/home2.png'
                  : 'assets/icons/home.png',
              width: 24,
              height: 24,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedIndex == 1
                  ? 'assets/icons/search2.png'
                  : 'assets/icons/search.png',
              width: 24,
              height: 24,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedIndex == 2
                  ? 'assets/icons/order.png'
                  : 'assets/icons/order.png',
              width: 24,
              height: 24,
            ),
            label: "Booking",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedIndex == 3
                  ? 'assets/icons/cart2.png'
                  : 'assets/icons/cart.png',
              width: 24,
              height: 24,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedIndex == 4
                  ? 'assets/icons/user2.png'
                  : 'assets/icons/user.png',
              width: 24,
              height: 24,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
