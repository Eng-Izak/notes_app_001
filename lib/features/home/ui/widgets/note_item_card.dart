import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_001/core/routing/routing_names.dart';
import 'package:notes_app_001/core/shared/models/note_model.dart';
import 'package:notes_app_001/features/home/logic/fetch_notes_list_cubit/fetch_notes_list_cubit.dart';

class NoteItemCard extends StatelessWidget {
  final NoteModel note;

  const NoteItemCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RoutingNames.editNote),
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
          left: 24,
          right: 16,
        ),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                note.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  note.content,
                  style: TextStyle(
                    color: Colors.black.withAlpha((255 * 0.4).toInt()),
                    fontSize: 16,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<FetchNotesListCubit>(
                    context,
                  ).fetchNotesList();
                },
                icon: const Icon(Icons.delete, color: Colors.black, size: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 8),
              child: Text(
                note.createdAt,
                style: TextStyle(
                  color: Colors.black.withAlpha((255 * 0.4).toInt()),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
