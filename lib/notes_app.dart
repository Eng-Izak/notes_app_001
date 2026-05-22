import 'package:flutter/material.dart';
import 'package:notes_app_001/core/routing/routing_names.dart';
import 'package:notes_app_001/core/routing/routing_router.dart';

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

      // 1. تحديد المسار البدائي للتطبيق من الكلاس الثابت
      initialRoute: RoutingNames.initial,
      // 2. تعيين دالة التوليد المخصصة التي قمنا بكتابتها
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
