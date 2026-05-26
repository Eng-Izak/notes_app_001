import 'package:flutter/material.dart';
import 'package:notes_app_001/features/home/ui/widgets/custom_border_theme.dart';

class CustomNoteInputField extends StatelessWidget {
  final String hintText;
  final int? maxLines;
  final void Function(String?)? onSaved;
  const CustomNoteInputField({
    super.key,
    required this.hintText,
    this.maxLines,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
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
        enabledBorder: customBorderTheme(),
        // الحدود عند الضغط والكتابة
        focusedBorder: customBorderTheme(),
        errorBorder: customBorderTheme().copyWith(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: customBorderTheme().copyWith(
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }
}
