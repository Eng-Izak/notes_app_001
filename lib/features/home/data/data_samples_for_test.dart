import 'package:flutter/material.dart';
import 'package:notes_app_001/core/shared/models/note_model.dart';
// قائمة بيانات تجريبية للملاحظات بألوان مختلفة كما في الصورة

final List<NoteModel> notes = [
  NoteModel(
    title: 'Flutter tips',
    content: 'Build your Career with Tharwat Samy',
    createdAt: 'May 21, 2022',
    color: 125464, // اللون البرتقالي الفاتح
  ),
  NoteModel(
    title: 'Flutter tips',
    content: 'Build your Career with Tharwat Samy',
    createdAt: 'May 21, 2022',
    color: 125464, // اللون الأخضر الليموني الفاتح
  ),
  NoteModel(
    title: 'Flutter tips',
    content: 'Build your Career with Tharwat Samy',
    createdAt: 'May 21, 2022',
    color: 125464, // اللون الأزرق السماوي
  ),
  NoteModel(
    title: 'Flutter tips',
    content: 'Build your Career with Tharwat Samy',
    createdAt: 'May 21, 2022',
    color: 125464, // اللون البنفسجي الفاتح
    kColor: const Color(0xFFCE93D8),
  ),
];
