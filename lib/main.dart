import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/globals.dart';
import 'package:notes_app/constants/hive_boxes.dart';
import 'package:notes_app/l10n/l10.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/modules/home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  final summaryBoxExists = await Hive.boxExists(HiveBoxes.notes_box,path: document.path);
  Hive.init(document.path);
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(HiveBoxes.notes_box);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'RobotoRegular',
      ),
      navigatorKey: AppGlobals.rootNavKey,
      locale: const Locale('en'),
      supportedLocales: L10.all,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        AppLocalizations.delegate
      ],
      home: const HomeScreen(),
    );
  }
}
