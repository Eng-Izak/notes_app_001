// --- الـ Bottom Sheet كـ Class مستقل وقابل لإعادة الاستخدام ---
import 'package:flutter/material.dart';
import 'package:notes_app_001/features/home/ui/widgets/custom_add_button.dart';
import 'package:notes_app_001/features/home/ui/widgets/custom_note_input_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),

              // حقل إدخال العنوان (Title)
              CustomNoteInputField(
                controller: _titleController,
                hintText: 'Title',
                maxLines: 1,
              ),
              const SizedBox(height: 16),

              // حقل إدخال المحتوى (Content)
              CustomNoteInputField(
                controller: _contentController,
                hintText: 'Content',
                maxLines: 5, // مساحة أكبر للنص الأساسي
              ),
              const SizedBox(height: 32),

              // زر الإضافة السفلي (Add Button)
              CustomAddButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
