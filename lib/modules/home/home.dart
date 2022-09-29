import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/colors.dart';
import 'package:notes_app/constants/hive_boxes.dart';
import 'package:notes_app/constants/styles.dart';
import 'package:notes_app/l10n/l10.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/modules/create_note/create_note.dart';
import 'package:notes_app/modules/details/details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notes_app/utils/date_util.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box<Note> dataBox;
  List<Note> notesList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notesList.add(Note.first());
    notesList.add(Note.second());
    notesList.add(Note.third());

    dataBox = Hive.box<Note>(HiveBoxes.notes_box);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:true,
      appBar: _buildAppBar(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: Icon(Icons.add,color: AppColors.white,),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CreateScreen()));
        },
      ),
      backgroundColor: Colors.black54,
      body: Container(
        padding: EdgeInsets.all(10),
        child: SafeArea(
          child: _buildList(notesList),
        ),
      ),
    );
  }
  
  Widget _buildList(List<Note> noteList){
    return ValueListenableBuilder(
      valueListenable: dataBox.listenable(),
      builder: (context,Box<Note> items, _) {
        List<String> keys = items.keys.cast<String>().toList();
        if(keys.length ==0){
          return Column(
              children:[
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  color: Colors.transparent,
                  child:
                  Center(child:Image.asset("assets/images/no-data.png",fit: BoxFit.fill,))
                ),
                Text("No Saved Notes.",style: TextStyles.titleHint,),
                Text("Start adding notes....",style: TextStyles.noteHint,),
              ]
          );
        }
        return  GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,

        ),
          itemCount: keys.length,
          itemBuilder: (BuildContext context, int index){
            var key = keys[index];
            var item = items.get(key);
            var color = AppColors.cardColors[randomColor()];
            return _noteCardItem(item!, color);
          },
        );
      },
    );
  }

  Widget _noteCardItem(Note item, Color color){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailScreen(note: item,)));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailScreen(note: item,)));
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title.trim(),style: TextStyles.title,),
                    const SizedBox(height: 15,),
                    Text(item.note.trim(),
                      maxLines: 4,
                      style: TextStyles.note,overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Text(DateUtil.formatDate(item.datetime),style: TextStyles.date..copyWith(color: Colors.black.withOpacity(0.5))),
               InkWell(child: Icon(Icons.delete,),
               onTap: ()async{
                 await dataBox.delete(item.id);
               },),
             ],
           )

          ],
        ),
      ),
    );
  }
}



PreferredSizeWidget _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black54,
    title: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(left: 0),
            child:Text(Localization.app_name,style: TextStyle(fontSize:28, color: Colors.white),)
        ),
        Container(
          padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
              color: Colors.red.shade200,
            ),
            child: Icon(Icons.search_outlined,size: 30,)
        ),
      ],
    ),
  );
}

int randomColor(){
  Random rnd;
  int min = 1;
  int max = 10;
  rnd = new Random();
  int r = min + rnd.nextInt(max - min);
  return r;
}