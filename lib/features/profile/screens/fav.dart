import 'package:flutter/material.dart';
import 'package:project/features/search/data/dummy_data.dart';
import 'package:project/features/search/widgets/salon_card.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('assets/images/logo.png', height: 40),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child: Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: constraints.maxWidth > 600 ? 1 : 0.65,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                ),
                itemCount: salonData.length,
                itemBuilder: (context, index) {
                  final salon = salonData[index];
                  return SalonCard(
                    imageUrl: salon['imageUrl'],
                    name: salon['name'],
                    rating: salon['rating'],
                    reviews: salon['reviews'],
                    gender: salon['gender'],
                    location: salon['location'],
                    availableSlot: salon['availableSlot'],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
