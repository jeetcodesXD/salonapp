import 'package:flutter/material.dart';
import 'package:project/core/common/custom_button.dart';

class EditUserDetailsScreen extends StatelessWidget {
  const EditUserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('assets/images/logo.png', height: 30),
            const SizedBox(width: 8),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit User Details and Submit',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTextField('Name*'),
            _buildTextField('Email Address*'),
            _buildTextField('Address*'),
            _buildTextField('State'),
            Row(
              children: [
                Expanded(child: _buildTextField('City*')),
                const SizedBox(width: 10),
                Expanded(child: _buildTextField('Zip Code*')),
              ],
            ),
            Row(
              children: [
                Expanded(child: _buildTextField('DD/MM/YYYY')),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: _inputDecoration(),
                    items: ['Male', 'Female', 'Other']
                        .map((String category) => DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: MyButton(
                text: 'Edit & Update',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: _inputDecoration().copyWith(hintText: hint),
        style: const TextStyle(color: Colors.grey),
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
