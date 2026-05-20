// import 'package:bloc/bloc.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:notes_app_001/core/dependency_injection/dependency_injection.dart';
// import 'package:notes_app_001/core/utils/observers/states_observer.dart';
import 'package:notes_app_001/notes_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection.init();
  // Bloc.observer = StatesObserver() as BlocObserver;

  // await Firebase.initializeApp(

  // options: DefaultFirebaseOptions.currentPlatform,

  // );

  runApp(NotesApp());
}
