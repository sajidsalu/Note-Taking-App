import 'package:flutter/material.dart';
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
                style: TextStyle(color: Colors.white,fontSize: 32.0, fontWeight: FontWeight.w500),
                maxLines: null,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 32.0, color: Colors.white.withOpacity(0.5)),
                ),
              ),

              SizedBox(
                height: 300,
                child: Expanded(
                  child: TextField(
                    maxLines: null,
                    style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.normal),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'type something...',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.white.withOpacity(0.5)),
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
            child: Text("Save", style: TextStyle(fontSize: 18,color: Colors.white),),
        ),
      ],
    ),
  );
}