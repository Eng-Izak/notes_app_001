import 'package:flutter/material.dart';
import 'package:notes_app_001/features/home/data/models/note_model.dart';

class NoteItemCard extends StatelessWidget {
  final NoteModel note;

  const NoteItemCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 16),
      decoration: BoxDecoration(
        color: note.color,
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
                note.subtitle,
                style: TextStyle(
                  color: Colors.black.withAlpha((255 * 0.4).toInt()),
                  fontSize: 16,
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete, color: Colors.black, size: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 8),
            child: Text(
              note.date,
              style: TextStyle(
                color: Colors.black.withAlpha((255 * 0.4).toInt()),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
