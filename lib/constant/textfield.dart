import 'package:flutter/material.dart';

class SbtTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  bool klavyeNumber;
   SbtTextfield({super.key, required this.controller, required this.label,  this.klavyeNumber=false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: klavyeNumber ? TextInputType.number : TextInputType.multiline,
              controller: controller,
              decoration: InputDecoration(
                
                border: const OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(16))
                ),
                label: Text(label)
              ),
            );
  }
}