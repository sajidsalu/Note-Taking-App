import 'package:flutter/material.dart';

class UiUtils {
  UiUtils._();

  static void removeFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
  }

}
