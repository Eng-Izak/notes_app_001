import 'package:bloc/bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app_001/core/shared/models/note_model.dart';
import 'package:notes_app_001/core/utils/constants/key_constants.dart';

part 'fetch_notes_list_state.dart';

class FetchNotesListCubit extends Cubit<FetchNotesListState> {
  FetchNotesListCubit() : super(FetchNotesListInitial());
  dynamic fetchNotesList() {
    try {
      Box<NoteModel> noteBox = Hive.box<NoteModel>(kNotesBox);
      final List<NoteModel> notes = noteBox.values.toList();
      emit(FetchNotesListSuccess(notes));
    } catch (e) {
      emit(FetchNotesListFailure(e.toString()));
    }
  }
}
