import 'package:flutter/material.dart';
import 'package:notes_app/l10n/l10.dart';

enum ButtonType{
  save,
  edit,
  search,
}
class Button extends StatefulWidget {

  ButtonType buttonType = ButtonType.edit;
  final GestureTapCallback? onTap;

  Button({Key? key,
    this.buttonType = ButtonType.edit,
    this.onTap}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey,
        ),
        child: _buildButton(widget.buttonType),
      ),
    );
  }

  Widget _buildButton(ButtonType type){
    switch(type){
      case ButtonType.save:{
        return Text(Localization.save, style: TextStyle(fontSize: 18,color: Colors.white),);
        break;
      }
      case ButtonType.edit:{
        return Icon(Icons.edit,size: 20,);
        break;
      }
      case ButtonType.search:{
        return Icon(Icons.search,size: 20,);
        break;
      }
    }
  }
}
