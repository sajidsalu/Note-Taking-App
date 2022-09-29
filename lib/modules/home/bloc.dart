import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/notes_db_service.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc{

  final _notes = BehaviorSubject<List<Note>>.seeded([]);
  Stream<List<Note>> get notes => _notes.stream;

  HomeBloc(){
   getAllNotes();
  }

  void getAllNotes(){
    List<Note> notes = NotesHiveService.getAllNotes() as List<Note>;
    notes.sort((a,b) => a.datetime.compareTo(b.datetime));
    _notes.sink.add(notes);
  }
}
