import 'package:bloc/bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app_001/core/shared/models/note_model.dart';
import 'package:notes_app_001/core/utils/constants/key_constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      Box<NoteModel> noteBox = Hive.box<NoteModel>(kNotesBox);
      emit(AddNoteSuccess());
      await noteBox.add(note);
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
