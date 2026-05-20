import 'package:flutter/material.dart';
import 'package:notes_app_001/features/home/data/models/note_model.dart';
// قائمة بيانات تجريبية للملاحظات بألوان مختلفة كما في الصورة

final List<NoteModel> notes = [
  NoteModel(
    title: 'Flutter tips',
    subtitle: 'Build your Career with Tharwat Samy',
    date: 'May 21, 2022',
    color: const Color(0xFFFFCC80), // اللون البرتقالي الفاتح
  ),
  NoteModel(
    title: 'Flutter tips',
    subtitle: 'Build your Career with Tharwat Samy',
    date: 'May 21, 2022',
    color: const Color(0xFFE6EE9C), // اللون الأخضر الليموني الفاتح
  ),
  NoteModel(
    title: 'Flutter tips',
    subtitle: 'Build your Career with Tharwat Samy',
    date: 'May 21, 2022',
    color: const Color(0xFF80DEEA), // اللون الأزرق السماوي
  ),
  NoteModel(
    title: 'Flutter tips',
    subtitle: 'Build your Career with Tharwat Samy',
    date: 'May 21, 2022',
    color: const Color(0xFFCE93D8), // اللون البنفسجي الفاتح
  ),
];
