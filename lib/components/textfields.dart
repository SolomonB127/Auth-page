import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  final controller;
  final String labelText;
  final bool obscureText;
  const Textfields(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            labelText: labelText,
            fillColor: Colors.grey.shade200,
            filled: true),
      ),
    );
  }
}
