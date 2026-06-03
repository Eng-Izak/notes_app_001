import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_001/core/shared/models/note_model.dart';
import 'package:notes_app_001/core/shared/widgets/custom_app_bar.dart';
import 'package:notes_app_001/features/home/logic/fetch_notes_list_cubit/fetch_notes_list_cubit.dart';
import 'package:notes_app_001/features/home/ui/widgets/custom_note_input_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note; // يمكنك تمرير الملاحظة المراد تعديلها عبر هذا المتغير

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
                      widget.note.save(); // حفظ التعديلات على الملاحظة الحالية
                      BlocProvider.of<FetchNotesListCubit>(
                        context,
                      ).fetchNotesList(); // تحديث قائمة الملاحظات بعد التعديل
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
                  initialValue: widget.note.title,
                  onSaved: (value) {
                    // title = value;
                    widget.note.title = value!;
                  },

                  maxLines: 1,
                ),
                const SizedBox(height: 16),

                // حقل إدخال المحتوى (Content)
                CustomNoteInputField(
                  initialValue: widget.note.content,
                  onSaved: (value) {
                    // content = value;
                    widget.note.content = value!;
                  },

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
