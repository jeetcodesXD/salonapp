import 'package:flutter/material.dart';
import 'package:project/core/common/custom_button.dart';
import 'package:project/features/home/dummy_data/data.dart';
import 'package:project/features/home/widgets/category.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            const Text(
              'Cart(4)',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            MyButton(
              text: "Add Service",
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: CategoryGrid(
              items: cartitems,
            ),
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: MyButton(
          text: "Checkout",
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
          onPressed: () {},
        ),
      ),
    );
  }
}
