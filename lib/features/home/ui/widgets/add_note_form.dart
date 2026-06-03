import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_001/core/shared/models/note_model.dart';
import 'package:notes_app_001/core/shared/widgets/colors_list_view_widget.dart';
import 'package:notes_app_001/features/home/logic/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app_001/features/home/logic/fetch_notes_list_cubit/fetch_notes_list_cubit.dart';
import 'package:notes_app_001/features/home/ui/widgets/custom_add_button.dart';
import 'package:notes_app_001/features/home/ui/widgets/custom_note_input_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
          // const SizedBox(height: 32),
          // نموذج إضافة الملاحظة (العنوان والمحتوى)
          Container(
            margin: const EdgeInsets.all(8.0),
            height: 50,
            child: ColorsListViewWidget(),
          ),
          // زر الإضافة السفلي (Add Button)
          CustomAddButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                String formattedDate = DateFormat(
                  'yyyy-MM-dd',
                ).format(DateTime.now());
                formKey.currentState!.save();
                NoteModel newNote = NoteModel(
                  title: title!,
                  content: content!,
                  createdAt: formattedDate,
                  // ignore: deprecated_member_use
                  color: BlocProvider.of<AddNoteCubit>(context).noteColor.value,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(newNote);
                BlocProvider.of<FetchNotesListCubit>(context).fetchNotesList();
              } else {
                setState(() => autoValidateMode = AutovalidateMode.always);
              }
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
