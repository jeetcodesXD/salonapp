import 'package:flutter/material.dart';
import 'package:project/core/common/custom_button.dart';

class CancelScreen extends StatelessWidget {
  const CancelScreen({super.key});

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(child: Image.asset('assets/images/cancel.png')),
            const Text(
              'Your order has been \n cancelled',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red, fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            MyButton(onPressed: () => {}, text: 'Search New Salon')
          ]),
        ),
      ),
    );
  }
}
