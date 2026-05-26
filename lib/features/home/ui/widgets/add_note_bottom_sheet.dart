// --- الـ Bottom Sheet كـ Class مستقل وقابل لإعادة الاستخدام ---
import 'package:flutter/material.dart';
import 'package:notes_app_001/features/home/ui/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(
          context,
        ).viewInsets.bottom, // يرفع التصميم تلقائياً عند ظهور الكيبورد
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Color(0xFF252525), // الخلفية الرمادية الداكنة للـ Dialog
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20), // حواف دائرية علوية فقط كما بالصورة
          ),
        ),
        child: SingleChildScrollView(child: AddNoteForm()),
      ),
    );
  }
}
