import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_001/features/home/logic/fetch_notes_list_cubit/fetch_notes_list_cubit.dart';
import 'package:notes_app_001/features/home/ui/widgets/custom_floating_action_button.dart';
import 'package:notes_app_001/core/shared/widgets/custom_app_bar.dart';
import 'package:notes_app_001/features/home/ui/widgets/notes_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // استدعاء الدالة fetchNotesList عند تحميل الصفحة لجلب الملاحظات من Hive
    BlocProvider.of<FetchNotesListCubit>(context).fetchNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Column(
            children: [
              // الهيدر العلوي يحتوي على كلمة Notes وزر البحث
              const CustomAppBar(txt: 'Notes', icon: Icons.search),
              const SizedBox(height: 24),
              // قائمة الملاحظات التمريرية
              NotesListView(),
            ],
          ),
        ),
      ),
      // زر الإضافة العائم أسفل اليمين باللون الفيروزي
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
