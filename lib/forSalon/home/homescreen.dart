import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomeScreenSalon extends StatefulWidget {
  const HomeScreenSalon({super.key});

  @override
  State<HomeScreenSalon> createState() => _HomeScreenSalonState();
}

class _HomeScreenSalonState extends State<HomeScreenSalon> {
  int _selectedIndex = 0;
  int _currentStep = 1; // Track KYC steps

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/profile1.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width: 2),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_outlined,
                              size: 28, color: Colors.grey),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      height: 40,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'John Doe',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // KYC Card
                Stack(
                  children: [
                    Container(
                      height: 190,
                      decoration: BoxDecoration(
                        color: const Color(0xFF7BC496),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: Image.asset(
                        'assets/images/kyc.png',
                        fit: BoxFit.cover,
                        height: 160,
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'You are not getting\ncustomers on time',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Let's list your salon in\nDizi Salon",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _currentStep = 2;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF18A558),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: const Size(0, 32),
                              elevation: 0,
                            ),
                            child: const Text(
                              "Let's do KYC",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Progress Steps
                Row(
                  children: [
                    _buildStep('Fill KYC', 1),
                    _buildStepLine(1),
                    _buildStep('List Salon', 2),
                    _buildStepLine(2),
                    _buildStep('List Services', 3),
                    _buildStepLine(3),
                    _buildStep('Take Orders', 4),
                  ],
                ),
                const SizedBox(height: 20),

                // List Now Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentStep = 3;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('List Now'),
                  ),
                ),
                const SizedBox(height: 20),

                // Trending Styles
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Trending Styles',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Show More'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Trending Images
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTrendingStyle('https://picsum.photos/100'),
                      const SizedBox(width: 8),
                      _buildTrendingStyle('https://picsum.photos/101'),
                      const SizedBox(width: 8),
                      _buildTrendingStyle('https://picsum.photos/102'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Dots Indicator
                Center(
                  child: DotsIndicator(
                    dotsCount: 4,
                    position: _selectedIndex.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'My Salons'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // KYC Step Builder
  Widget _buildStep(String title, int step) {
    bool isActive = step <= _currentStep;
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Theme.of(context).primaryColor : Colors.grey[300],
          ),
          child: Icon(
            Icons.check,
            size: 16,
            color: isActive ? Colors.white : Colors.grey[400],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Theme.of(context).primaryColor : Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Step Line
  Widget _buildStepLine(int step) {
    return Container(
      width: 30,
      height: 2,
      color: step <= _currentStep
          ? Theme.of(context).primaryColor
          : Colors.grey[300],
    );
  }

  // Trending Styles
  Widget _buildTrendingStyle(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child:
          Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
    );
  }
}
