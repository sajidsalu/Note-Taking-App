import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/services/notes_db_service.dart';
import 'package:rxdart/subjects.dart';
import 'package:uuid/uuid.dart';

class CreateNoteBloc{

  final _titleController = TextEditingController();
  final _noteController = TextEditingController();

  CreateNoteBloc(){
    _titleController.text='';
    _noteController.text='';
  }
  get titleController => _titleController;
  get noteController => _noteController;

  final note = BehaviorSubject<Note>();

  void saveNote(String title, String note)async{
    print("title to save $title");
    var uuid = Uuid();
    Note noteObj = Note(id:uuid.v1() ,
        title: title,
        note: note,
        datetime: DateTime.now().millisecondsSinceEpoch.toString());
    print("note object $noteObj");
    NotesHiveService.insertNote(noteObj);
  }
}