import 'package:flutter/material.dart';
import 'package:notes_app_001/core/shared/widgets/custom_app_bar.dart';
import 'package:notes_app_001/features/home/ui/widgets/custom_note_input_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              children: [
                CustomAppBar(
                  txt: 'Edit Note',
                  icon: Icons.check,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      // هنا يمكنك إضافة الكود لحفظ الملاحظة الجديدة باستخدام العنوان والمحتوى
                      Navigator.pop(context);
                    } else {
                      setState(
                        () => autoValidateMode = AutovalidateMode.always,
                      );
                    }
                  },
                ),
                const SizedBox(height: 24),

                const SizedBox(height: 10),

                // حقل إدخال العنوان (Title)
                CustomNoteInputField(
                  onSaved: (value) {
                    title = value;
                  },
                  hintText: 'Title',
                  maxLines: 1,
                ),
                const SizedBox(height: 16),

                // حقل إدخال المحتوى (Content)
                CustomNoteInputField(
                  onSaved: (value) {
                    content = value;
                  },
                  hintText: 'Content',
                  maxLines: 5, // مساحة أكبر للنص الأساسي
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
