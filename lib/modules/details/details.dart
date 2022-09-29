import 'package:flutter/material.dart';
import 'package:notes_app/constants/colors.dart';
import 'package:notes_app/constants/styles.dart';

import '../../models/note.dart';
class DetailScreen extends StatefulWidget {
  final Note note;

  const DetailScreen({Key? key, required this.note}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Note note ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    note= widget.note;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note.title,style: TextStyles.titleRead),
              SizedBox(height: 30,),
              Text(note.datetime,style: TextStyles.dateRead.copyWith(color: AppColors.whiteSmoke.withOpacity(0.5))),
              SizedBox(height: 15,),
              Text(note.note, style: TextStyles.noteRead),
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.black,
    title: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
              color: Colors.red.shade200,
            ),
            child: Icon(Icons.edit,size: 20,)
        ),
      ],
    ),
  );
}