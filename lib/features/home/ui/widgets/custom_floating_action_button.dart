import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: const Color(0xFF4EE2CE), // درجة اللون الفيروزي من الصورة
      shape: const CircleBorder(),
      child: const Icon(Icons.add, color: Colors.black, size: 28),
    );
  }
}
