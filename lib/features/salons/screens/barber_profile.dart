import 'package:flutter/material.dart';
import 'package:project/features/home/widgets/category.dart';
import 'package:project/features/salons/data/dummy_data.dart';
import 'package:project/features/salons/widgets/review.dart';

class BarberProfileScreen extends StatelessWidget {
  const BarberProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, size: 20),
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
                            image: AssetImage('assets/images/barber.png'),
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Services',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     // Navigator.push(
                        //     //   context,
                        //     //   MaterialPageRoute(
                        //     //     builder: (context) =>
                        //     //         const SalonServicesScreen(),
                        //     //   ),
                        //     // );
                        //   },
                        //   child: const Text(
                        //     'See More',
                        //     style: TextStyle(
                        //       color: Color(0xFF1E2B8C),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CategoryGrid(items: salonservices),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Recent Reviews',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ReviewItem(
                        name: 'Nitesh Kumawat',
                        date: 'March 11, 2023',
                        review:
                            'The service provided by the salon is awesome I like the hair style.',
                        rating: 5),
                    ReviewItem(
                        name: 'Nitesh Kumawat',
                        date: 'March 11, 2023',
                        review:
                            'The service provided by the salon is awesome I like the hair style.',
                        rating: 5),
                    ReviewItem(
                        name: 'Nitesh Kumawat',
                        date: 'March 11, 2023',
                        review:
                            'The service provided by the salon is awesome I like the hair style.',
                        rating: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
