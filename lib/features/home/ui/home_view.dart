import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_001/features/home/data/data_samples_for_test.dart';
import 'package:notes_app_001/features/home/logic/fetch_notes_list_cubit/fetch_notes_list_cubit.dart';
import 'package:notes_app_001/features/home/ui/widgets/custom_floating_action_button.dart';
import 'package:notes_app_001/features/home/ui/widgets/note_item_card.dart';
import 'package:notes_app_001/core/shared/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchNotesListCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 12.0,
            ),
            child: Column(
              children: [
                // الهيدر العلوي يحتوي على كلمة Notes وزر البحث
                const CustomAppBar(txt: 'Notes', icon: Icons.search),
                const SizedBox(height: 24),
                // قائمة الملاحظات التمريرية
                Expanded(
                  child: ListView.builder(
                    itemCount: notes.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: NoteItemCard(note: notes[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // زر الإضافة العائم أسفل اليمين باللون الفيروزي
        floatingActionButton: const CustomFloatingActionButton(),
      ),
    );
  }
}
