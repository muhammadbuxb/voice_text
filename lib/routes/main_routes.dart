import 'package:flutter/cupertino.dart';
import 'package:voice_text/pages/speech_text.dart';

class MainRoutes {
  Map<String, Widget Function(BuildContext)> routes = {
    '/':(context)=>SpeechText(),
  };
}
