import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_001/core/shared/models/note_model.dart';
import 'package:notes_app_001/features/home/logic/fetch_notes_list_cubit/fetch_notes_list_cubit.dart';
import 'package:notes_app_001/features/home/ui/widgets/note_item_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FetchNotesListCubit, FetchNotesListState>(
        builder: (context, state) {
          List<NoteModel> notes = BlocProvider.of<FetchNotesListCubit>(
            context,
          ).notes!;
          return ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: NoteItemCard(note: notes[index]),
              );
            },
          );
        },
      ),
    );
  }
}
