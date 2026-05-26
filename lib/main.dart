import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:notes_app_001/core/dependency_injection/dependency_injection.dart';
import 'package:notes_app_001/core/utils/constants/key_constants.dart';
import 'package:notes_app_001/notes_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  DependencyInjection.init();

  runApp(NotesApp());
}
