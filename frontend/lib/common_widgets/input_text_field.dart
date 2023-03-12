// flutter
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {

  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?) validator;
  final String label;

  InputTextField({required this.controller, required this.validator, required this.label, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          constraints: BoxConstraints(
            maxHeight: screenHeight * 0.06,
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.5)
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.5)
          ),
          border: const OutlineInputBorder(),
          label: Text(label)
      ),
      validator: validator,
    );
  }

}