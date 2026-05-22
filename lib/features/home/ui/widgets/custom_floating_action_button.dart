import 'package:flutter/material.dart';
import 'package:notes_app_001/features/home/ui/widgets/add_note_bottom_sheet.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true, // يضمن عدم اختفاء الحقول خلف الكيبورد
        backgroundColor:
            Colors.transparent, // لجعل الحواف الدائرية تعمل بشكل صحيح
        builder: (context) => const AddNoteBottomSheet(),
      ),
      backgroundColor: const Color(0xFF4EE2CE), // درجة اللون الفيروزي من الصورة
      shape: const CircleBorder(),
      child: const Icon(Icons.add, color: Colors.black, size: 28),
    );
  }
}
