// --- الـ Bottom Sheet كـ Class مستقل وقابل لإعادة الاستخدام ---
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app_001/features/home/logic/cubit/add_note_cubit.dart';
import 'package:notes_app_001/features/home/ui/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddNoteCubit>(
      create: (context) => AddNoteCubit(),
      child: Padding(
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
            child: BlocConsumer<AddNoteCubit, AddNoteState>(
              listener: (context, state) {
                if (state is AddNoteFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to add note')),
                  );
                }
                if (state is AddNoteSuccess) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return ModalProgressHUD(
                  inAsyncCall: state is AddNoteLoading
                      ? true
                      : false, // إظهار الـ Loading أثناء عملية الحفظ
                  child: AddNoteForm(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
