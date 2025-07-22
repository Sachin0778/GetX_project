import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceController extends GetxController {
  late stt.SpeechToText _speech;
  var isListening = false.obs;
  var text = ''.obs;
  var speechList = <String>[].obs; // List to store all speeches

  final FlutterTts _flutterTts = FlutterTts();
  var isPlaying = false.obs;
  var isPaused = false.obs;
  var currentIndex = (-1).obs;
  var estimatedDuration = 0.0.obs; // in seconds

  @override
  void onInit() {
    super.onInit();
    _speech = stt.SpeechToText();
    _flutterTts.setCompletionHandler(() {
      isPlaying.value = false;
      isPaused.value = false;
      currentIndex.value = -1;
    });
  }

  void startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      isListening.value = true;
      text.value = ''; // Clear previous text
      _speech.listen(
        onResult: (result) {
          text.value = result.recognizedWords;
        },
      );
    }
  }

  void stopListening() {
    _speech.stop();
    isListening.value = false;
    if (text.value.trim().isNotEmpty) {
      speechList.add(text.value.trim());
      text.value = '';
    }
  }

  Future<void> playSpeech(String text, int index) async {
    await _flutterTts.stop();
    currentIndex.value = index;
    isPlaying.value = true;
    isPaused.value = false;
    estimatedDuration.value = estimateDuration(text);
    await _flutterTts.speak(text);
  }

  Future<void> pauseSpeech() async {
    await _flutterTts.pause();
    isPaused.value = true;
    isPlaying.value = false;
  }

  double estimateDuration(String text) {
    // Rough estimate: 150 words per minute (2.5 words/sec)
    final words = text.split(' ').length;
    return words / 2.5;
  }
}