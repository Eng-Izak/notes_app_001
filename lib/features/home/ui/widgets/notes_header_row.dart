import 'package:flutter/material.dart';
import 'package:notes_app_001/features/home/ui/widgets/custom_search_button.dart';

class NotesHeaderRow extends StatelessWidget {
  const NotesHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Notes',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        CustomSearchButton(),
      ],
    );
  }
}
