import 'package:flutter/material.dart';
import 'package:notes_app/constants/colors.dart';
import 'package:notes_app/constants/styles.dart';
import 'package:notes_app/l10n/l10.dart';
import 'package:notes_app/models/note.dart';


class CreateScreen extends StatefulWidget {

  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  late Note note ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              TextField(
                style: TextStyles.titleCreate,
                maxLines: null,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: Localization.title,
                  hintStyle: TextStyles.titleHint.copyWith(color: AppColors.white.withOpacity(0.5)),
                ),
              ),

              SizedBox(
                height: 300,
                child: Expanded(
                  child: TextField(
                    maxLines: null,
                    style: TextStyles.noteCreate,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Localization.typeSomething,
                      hintStyle: TextStyles.noteHint.copyWith(color: AppColors.white.withOpacity(0.5)),
                    ),
                  ),
                ),
              ),
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
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
            child: Text(Localization.save, style: TextStyle(fontSize: 18,color: Colors.white),),
        ),
      ],
    ),
  );
}