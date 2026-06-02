import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_001/features/home/logic/add_note_cubit/add_note_cubit.dart';

class CustomAddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomAddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // ليمتد على كامل عرض الشاشة
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(
            0xFF4EE2CE,
          ), // درجة اللون الفيروزي من الصورة
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: BlocListener<AddNoteCubit, AddNoteState>(
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
          child: State is AddNoteLoading
              ? SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(color: Colors.black),
                ) // مؤشر تحميل أسود أثناء العملية
              : Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.black, // نص أسود فوق الخلفية الفيروزية
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
