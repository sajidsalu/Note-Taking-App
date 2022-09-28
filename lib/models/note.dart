class Note {
  final String id;
  final String title;
  final String note;
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
}