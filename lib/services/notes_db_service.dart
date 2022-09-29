import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/hive_boxes.dart';
import 'package:notes_app/models/note.dart';
import 'package:uuid/uuid.dart';

class NotesHiveService{
  NotesHiveService._();
  
  static void insertNote(Note note) async{
    Box<Note> dataBox = Hive.box<Note>(HiveBoxes.notes_box);
    await dataBox.put(note.id,note);
  }
  static Future<List<Note>> getAllNotes() async {
    Box<Note> dataBox = Hive.box<Note>(HiveBoxes.notes_box);
    var notes= dataBox.values.toList();
    print("items are ${notes}");
    dataBox.close();
    return notes;
  }
}