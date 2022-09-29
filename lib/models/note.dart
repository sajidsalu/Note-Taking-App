import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String note;
  @HiveField(3)
  final String datetime;

  Note({required this.id, required this.title, required this.note, required this.datetime});

  Note.first({
    this.id: '1001',
    this.title: 'My notes',
    this.note: 'this is a long note',
    this.datetime: '28 Sep 2022',
  });

  Note.second({
    this.id: '1002',
    this.title: 'yet another note',
    this.note: 'this also a long notedsdisfhdwfkdfnklwdfwdf',
    this.datetime: '28 Sep 2022',
  });

  Note.third({
    this.id: '1003',
    this.title: 'a new one',
    this.note: 'long long long noten sdwd.kfwd;fwdgd',
    this.datetime: '28 Sep 2022',
  });

  @override
  String toString() {
    // TODO: implement toString
    return "{id:$id, title:$title, note:$note,datetime:$datetime}";

  }
}