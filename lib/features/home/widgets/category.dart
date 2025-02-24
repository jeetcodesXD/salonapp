import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/features/salons/screens/salon_detail_screen.dart';

class CategoryGrid extends StatelessWidget {
  final List<Map<String, String>> items;
  const CategoryGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 14,
        crossAxisSpacing: 7,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SalonDetailScreen(),
              ),
            );
          },
          child: Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color.fromARGB(182, 0, 42, 91), width: 1),
                  image: DecorationImage(
                    image: AssetImage(items[index]["image"]!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                items[index]["name"]!,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
