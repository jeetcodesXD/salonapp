import 'package:flutter/material.dart';
import 'package:project/core/common/custom_button.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  void _showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/confirm_logo.png', height: 60),
                const SizedBox(height: 16),
                const Text(
                  'You have successfully sent your message',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 16),
                MyButton(
                  text: 'Confirm',
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text('Contact Us',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text('Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              _buildTextField('Name*'),
              const SizedBox(height: 8),
              const Text('Mobile Number',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              _buildTextField('Mobile Number*'),
              const SizedBox(height: 8),
              const Text('E-Mail',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              _buildTextField('E-Mail*'),
              const SizedBox(height: 8),
              const Text('Message',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              _buildTextField('Message', maxLines: 3),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: MyButton(
                  text: 'Submit',
                  onPressed: () => _showConfirmDialog(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        decoration: _inputDecoration().copyWith(hintText: hint),
        style: const TextStyle(color: Colors.grey),
        maxLines: maxLines,
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }
}
