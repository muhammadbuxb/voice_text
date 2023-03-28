import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechText extends StatefulWidget {
  const SpeechText({super.key});
  // static String route = '/speechtext';

  @override
  State<SpeechText> createState() => _SpeechText();
}

class _SpeechText extends State<SpeechText> {
  final Map<String, HighlightedWord> _highlights = {
    'flutter': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: const TextStyle(
        color: Colors.lightGreen,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    'hello': HighlightedWord(
      onTap: () => print('hello'),
      textStyle: const TextStyle(
        color: Colors.redAccent,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    'like': HighlightedWord(
      onTap: () => print('like'),
      textStyle: const TextStyle(
        color: Colors.blueGrey,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    'voice': HighlightedWord(
      onTap: () => print('voice'),
      textStyle: const TextStyle(
        color: Colors.orange,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  SpeechToText speechToText = SpeechToText();
  var printText = 'Hold the Button and Start Speaking';
  var isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
            endRadius: 100.0,
            animate: isListening,
            duration: Duration(milliseconds: 2000),
            glowColor: Colors.blueGrey,
            repeat: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            showTwoGlows: true,
            child: GestureDetector(
                onTapDown: (details) async {
                  if (!isListening) {
                    var available = await speechToText.initialize();
                    if (available) {
                      setState(() {
                        isListening = true;
                        speechToText.listen(onResult: (result) {
                          setState(() {
                            printText = result.recognizedWords;
                          });
                        });
                      });
                    }
                  }
                },
                onTapUp: (details) {
                  setState(
                    () {
                      isListening = false;
                    },
                  );
                  speechToText.stop();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                  radius: 40,
                  child: Icon(
                    isListening ? Icons.mic : Icons.mic_none,
                    color: Colors.white,
                    size: 35,
                  ),
                ))),
        appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              'Speech to Text',
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: []),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            height: Get.height * 6,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextHighlight(
                  words: _highlights,
                  text: printText,
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
