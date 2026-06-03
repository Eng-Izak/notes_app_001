import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_001/core/shared/widgets/note_color_widget.dart';
import 'package:notes_app_001/core/theming/theming_colors.dart';
import 'package:notes_app_001/features/home/logic/add_note_cubit/add_note_cubit.dart';

class ColorsListViewWidget extends StatefulWidget {
  const ColorsListViewWidget({super.key});

  @override
  State<ColorsListViewWidget> createState() => _ColorsListViewWidgetState();
}

class _ColorsListViewWidgetState extends State<ColorsListViewWidget> {
  int currentSelectedIndex = 0; // مؤشر اللون المختار
  bool isSelected =
      true; // حالة لتحديد اللون المختار، يمكنك تعديل هذا بناءً على حالتك
  @override
  Widget build(BuildContext context) {
    List<Color> colors = ThemingColors.noteColors;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: colors.length, // عدد الألوان المتاحة
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            isSelected = !isSelected; // تحديث الحالة لتحديد اللون المختار
            // هنا يمكنك إضافة الكود لتحديد اللون المختار وتحديث الحالة
            setState(() {
              // تحديث الحالة لتحديد اللون المختار
              currentSelectedIndex = index;
              // تحديث مؤشر اللون المختار
              BlocProvider.of<AddNoteCubit>(context).noteColor =
                  colors[index]; // تحديث اللون في الـ Cubit
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: NoteColorWidget(
              color: colors[index],
              isSelected: index == currentSelectedIndex,
            ),
          ),
        );
      },
    );
  }
}
