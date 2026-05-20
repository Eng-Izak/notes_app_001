import 'package:flutter/material.dart';
import 'package:notes_app_001/features/home/ui/home_view.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(
          0xFF1F1F1F,
        ), // لون الخلفية الداكن الشبيه بالصورة
      ),
      home: const HomeView(),
    );
  }
}
