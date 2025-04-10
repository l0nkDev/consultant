// lib/presentation/screens/query_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/query_provider.dart';
import '../widgets/organisms/conversation_view.dart';
import '../widgets/organisms/input_area.dart';
import '../../core/constants/app_text_constants.dart';
import '../../tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class QueryScreen extends StatefulWidget {
  const QueryScreen({super.key});

  @override
  State<QueryScreen> createState() => _QueryScreenState();
}


class _QueryScreenState extends State<QueryScreen> {
  final TextEditingController _controller = TextEditingController();
  late Tts tts = Tts();
  stt.SpeechToText _speechToText = stt.SpeechToText();
  bool speechEnabled = false;

  void _startListening() async {
    print("started listening");
    await _speechToText.listen(
      onResult: (SpeechRecognitionResult result) {
        _controller.text = result.recognizedWords;
      }, 
      partialResults: false, 
      localeId: "es_ES");
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    tts.init();
    _initSpeech();
  }

  void _initSpeech() async {
    speechEnabled = await _speechToText.initialize();
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    final queryProvider = Provider.of<QueryProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppText.queryScreenTitle)),
      body: Column(
        children: [
          Expanded(
            child: ConversationView(
              messages: queryProvider.getMessages(),
              isLoading: queryProvider.isLoading,
            ),
          ),
          InputArea(
            controller: _controller,
            onSubmit: () {
              final query = _controller.text.trim();
              if (query.isNotEmpty) {
                queryProvider.sendQuery(query);
                _controller.clear();
              }
            },
            ttsStart: (){
              print(_speechToText.isNotListening);
              _speechToText.isNotListening ? _startListening() : _stopListening();
              print("tts started supposedly");
            }
          ),
        ],
      ),
    );
  }
}
