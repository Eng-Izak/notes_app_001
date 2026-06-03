import 'package:flutter/material.dart';

class NoteColorWidget extends StatelessWidget {
  const NoteColorWidget({
    super.key,
    required this.color,
    this.isSelected = false,
  });
  final Color color;

  // يمكنك تعديل هذا بناءً على حالتك
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: CircleAvatar(radius: isSelected ? 30 : 20, backgroundColor: color),
    );
  }
}
