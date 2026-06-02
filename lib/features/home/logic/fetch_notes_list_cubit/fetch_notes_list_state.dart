part of 'fetch_notes_list_cubit.dart';

@immutable
sealed class FetchNotesListState {}

final class FetchNotesListInitial extends FetchNotesListState {}

final class FetchNotesListSuccess extends FetchNotesListState {}

final class FetchNotesListFailure extends FetchNotesListState {}
