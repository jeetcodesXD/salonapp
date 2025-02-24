import 'package:flutter/material.dart';
import 'package:project/features/home/widgets/category.dart';
import 'package:project/features/salons/data/dummy_data.dart';
import 'package:project/features/salons/screens/salon_review_screen.dart';
import 'package:project/features/salons/screens/salon_services.dart';
import 'package:project/features/salons/screens/serviceprovider_list.dart';
import 'package:project/features/salons/widgets/barber.dart';
import 'package:project/features/salons/widgets/review.dart';

class SalonDetailScreen extends StatelessWidget {
  const SalonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 280,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/salon.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_sharp, size: 18),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E2B8C),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'View Gallery',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: const Offset(8, -60),
                      child: Container(
                        width: 133,
                        height: 160,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(
                            image: AssetImage('assets/images/salon_barber.png'),
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'James Doe',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF022A6D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Salon Name',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            ...List.generate(
                                4,
                                (index) => const Icon(Icons.star,
                                    size: 16, color: Color(0xFFFFB837))),
                            const Icon(Icons.star,
                                size: 16, color: Colors.grey),
                            const SizedBox(width: 6),
                            const Text(
                              '4.0',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '(102 reviews)',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -40),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(spacing: 0, runSpacing: 20, children: [
                    _buildSocialStat(Icons.ac_unit, 'AC'),
                    _buildSocialStat(Icons.tv, 'TV'),
                    _buildSocialStat(Icons.newspaper, 'News'),
                    _buildSocialStat(Icons.book, 'Magazine'),
                    _buildSocialStat(Icons.wifi, 'Wifi'),
                  ]),
                ),
              ),
              const Divider(thickness: 0),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoItem(Icons.location_on,
                              "Kc-3, Jaipur, Rajasthan-302003"),
                          const SizedBox(height: 8),
                          _buildInfoItem(Icons.access_time,
                              "9.30 AM - 6.30 PM  Mon - Sat"),
                        ],
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoItem(Icons.phone, "6375445824"),
                          const SizedBox(height: 8),
                          _buildInfoItem(Icons.person, "Unisex Salon"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 0),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Services',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SalonServicesScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'See More',
                            style: TextStyle(
                              color: Color(0xFF1E2B8C),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CategoryGrid(items: salonservices),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Recommended',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SalonServiceProviderScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'View More',
                            style: TextStyle(
                              color: Color(0xFF1E2B8C),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const BarberItem(
                      name: 'Manish Singh',
                      price: '150 Rs',
                      duration: '45 mins',
                      indicatorColor: Colors.orange,
                      isBookButton: true,
                    ),
                    const BarberItem(
                      name: 'Abhishek',
                      price: '70 Rs',
                      duration: '25 mins',
                      indicatorColor: Colors.green,
                      isBookButton: false,
                    ),
                    const BarberItem(
                      name: 'Sumita',
                      price: '200 Rs',
                      duration: '45 mins',
                      indicatorColor: Colors.orange,
                      isBookButton: true,
                    ),
                    const BarberItem(
                      name: 'Manish Singh',
                      price: '150 Rs',
                      duration: '45 mins',
                      indicatorColor: Colors.orange,
                      isBookButton: true,
                    ),
                    const BarberItem(
                      name: 'Abhishek',
                      price: '70 Rs',
                      duration: '25 mins',
                      indicatorColor: Colors.green,
                      isBookButton: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recent Reviews',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const ReviewItem(
                        name: 'Nitesh Kumawat',
                        date: 'March 11, 2023',
                        review:
                            'The service provided by the salon is awesome I like the hair style.',
                        rating: 5),
                    const ReviewItem(
                        name: 'Nitesh Kumawat',
                        date: 'March 11, 2023',
                        review:
                            'The service provided by the salon is awesome I like the hair style.',
                        rating: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SalonReviewScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'See More..',
                        style: TextStyle(
                          color: Color(0xFF1E2B8C),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialStat(IconData icon, String text) {
    return SizedBox(
      width: 90,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 20),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
