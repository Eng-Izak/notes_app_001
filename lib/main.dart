import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:notes_app_001/core/dependency_injection/dependency_injection.dart';
import 'package:notes_app_001/core/shared/models/note_model.dart';
import 'package:notes_app_001/core/utils/constants/key_constants.dart';
import 'package:notes_app_001/core/utils/observers/states_observer.dart';
import 'package:notes_app_001/notes_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = StatesObserver();
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());
  DependencyInjection.init();

  runApp(NotesApp());
}
