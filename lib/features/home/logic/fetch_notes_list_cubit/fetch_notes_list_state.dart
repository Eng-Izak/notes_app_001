part of 'fetch_notes_list_cubit.dart';

@immutable
sealed class FetchNotesListState {}

final class FetchNotesListInitial extends FetchNotesListState {}

final class FetchNotesListLoading extends FetchNotesListState {}

final class FetchNotesListSuccess extends FetchNotesListState {
  final List<NoteModel> notes;

  FetchNotesListSuccess(this.notes);
}

final class FetchNotesListFailure extends FetchNotesListState {
  final String message;

  FetchNotesListFailure(this.message);
}
