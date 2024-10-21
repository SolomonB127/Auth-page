import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final void Function()? onTap;
  final String imgPath;
  const Tile({super.key, required this.imgPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200]),
        child: Image.asset(
          imgPath,
          height: 40,
        ),
      ),
    );
  }
}
