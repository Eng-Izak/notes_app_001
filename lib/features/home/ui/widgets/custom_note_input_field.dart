import 'package:flutter/material.dart';

class CustomNoteInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int? maxLines;

  const CustomNoteInputField({
    super.key,
    this.controller,
    required this.hintText,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      cursorColor: const Color(0xFF4EE2CE), // لون المؤشر الفيروزي
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(
            0xFF4EE2CE,
          ), // لون النصوص التوضيحية الفيروزي المطابق للصورة
          fontSize: 16,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        // الحدود الافتراضية
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        // الحدود عند الضغط والكتابة
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF4EE2CE), width: 1.5),
        ),
      ),
    );
  }
}
