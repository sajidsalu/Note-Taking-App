import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/notes_db_service.dart';
import 'package:rxdart/subjects.dart';

class DetailsBloc{
  final _isEditable = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isEditable => _isEditable.stream;

  void setIsEditable(bool value){
    _isEditable.sink.add(value);
  }

  Future<Note> saveNote(Note note,String title, String desc)async{
    print("title to save ${note.id}");
    Note noteObj = Note( id:note.id,
        title: title,
        note: desc,
        datetime: note.datetime,);
    print("note object $noteObj");
    NotesHiveService.insertNote(noteObj);
    return noteObj;
  }
}