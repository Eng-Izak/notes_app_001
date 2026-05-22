import 'package:flutter/material.dart';
import 'package:notes_app_001/core/shared/widgets/custom_app_bar.dart';
import 'package:notes_app_001/features/home/ui/widgets/custom_note_input_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Column(
            children: [
              const CustomAppBar(txt: 'Edit Note', icon: Icons.check),
              const SizedBox(height: 24),
              CustomNoteInputField(hintText: "title"),
              const SizedBox(height: 24),
              CustomNoteInputField(hintText: "content", maxLines: 5),
            ],
          ),
        ),
      ),
    );
  }
}
