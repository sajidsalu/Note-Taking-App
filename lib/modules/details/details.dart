import 'package:flutter/material.dart';
import 'package:notes_app/constants/colors.dart';
import 'package:notes_app/constants/styles.dart';
import 'package:notes_app/l10n/l10.dart';
import 'package:notes_app/modules/details/bloc.dart';
import 'package:notes_app/utils/date_util.dart';
import 'package:notes_app/utils/ui_utils.dart';
import 'package:notes_app/widgets/button.dart';

import '../../models/note.dart';
class DetailScreen extends StatefulWidget {
  final Note note;
  const DetailScreen({Key? key, required this.note}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isEditable = false;
  late Note note ;
  var focusNode = FocusNode();

  DetailsBloc _bloc= DetailsBloc();
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    note= widget.note;
    _titleController.text= note.title;
    _noteController.text = note.note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.black,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: StreamBuilder<bool>(
              stream: _bloc.isEditable,
              builder: (context, snapshot) {
                var isEditable = snapshot.data as bool;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isEditable ?
                    TextField(
                      controller: _titleController,
                      style: TextStyles.titleCreate,
                      maxLines: null,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: Localization.title,
                        hintStyle: TextStyles.titleHint.copyWith(color: AppColors.white.withOpacity(0.5)),
                      ),
                    ):
                    Text(note.title,style: TextStyles.titleRead),
                    const SizedBox(height: 30,),
                    Text(DateUtil.formatDate(note.datetime),style: TextStyles.dateRead.copyWith(color: AppColors.whiteSmoke.withOpacity(0.5))),
                    const SizedBox(height: 15,),
                    isEditable?
                    SizedBox(
                      height: 300,
                      child: TextField(
                        autofocus: true,
                        controller: _noteController,
                        maxLines: null,
                        style: TextStyles.noteCreate,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: Localization.typeSomething,
                          hintStyle: TextStyles.noteHint.copyWith(color: AppColors.white.withOpacity(0.5)),
                        ),
                      ),
                    ):
                    Text(note.note, style: TextStyles.noteRead),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
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
            child: StreamBuilder<bool>(
              stream: _bloc.isEditable,
              builder: (context, snapshot) {
                var isEdit = snapshot.data as bool;
                return Button(buttonType: isEdit ? ButtonType.save: ButtonType.edit,
                onTap: ()async{
                  print("is edit${isEdit}");
                  if(isEdit){
                    Note notetmp= await _bloc.saveNote(widget.note, _titleController.text, _noteController.text);
                    note= notetmp;
                    UiUtils.removeFocus(context);
                  }
                  _bloc.setIsEditable(!isEdit);
                },);
              }
            ),
          ),
        ],
      ),
    );
  }
}

