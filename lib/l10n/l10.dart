import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notes_app/constants/globals.dart';
class L10 {
  static const all =[Locale('en')];
}

AppLocalizations get Localization => AppLocalizations.of(AppGlobals.rootNavKey.currentContext!)!;

get Locales => AppLocalizations.of(AppGlobals.rootNavKey.currentContext!)!;