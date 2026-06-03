// import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  final String createdAt;
  @HiveField(3)
  int color;
  // final Color? kColor;

  NoteModel({
    required this.title,
    required this.content,
    required this.createdAt,
    required this.color,
    // this.kColor,
  });
}
