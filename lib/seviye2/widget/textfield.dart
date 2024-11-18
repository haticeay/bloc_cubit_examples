import 'package:flutter/material.dart';

class SbtTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const SbtTextfield({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(

                ),
                label: Text(label)
              ),
            );
  }
}