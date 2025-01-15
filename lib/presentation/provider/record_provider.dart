import 'dart:async';
import 'dart:developer';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:chat_app/presentation/chat/chat_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class RecordProvider with ChangeNotifier {
  final RecorderController recorderController = RecorderController();
  Timer? _waveformTimer;
  Duration _elapsedTime = Duration.zero;
  bool isRecording = false;
  bool isPlaying = false;
  bool isPaused = false;

  RecordProvider() {
    recorderController.checkPermission();
  }

  Duration get elapsedTime => _elapsedTime;

  void startRecording() async {
    try {
      _waveformTimer?.cancel();

      await recorderController.record();
      isRecording = true;
      sendAsChatOrOrderNotifier.value = isRecording;
      _elapsedTime = Duration.zero;

      _waveformTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        _elapsedTime += const Duration(seconds: 1);
        notifyListeners();
      });
    } catch (e) {
      debugPrint("Error starting recording: $e");
    }
  }

  void stopRecording() async {
    try {
      final path = await recorderController.stop();
      recordingPath = path;
      recordingPathNotifier.value = recordingPath;
      isRecording = false;
      sendAsChatOrOrderNotifier.value = isRecording;

      notifyListeners();
      _waveformTimer?.cancel();
    } catch (e) {
      debugPrint("Error stopping recording: $e");
    }
    notifyListeners();
  }

  void pauseRecording() async {
    try {
      await recorderController.pause();
      isPlaying = !isPlaying;
      isPaused = !isPaused;

      _waveformTimer?.cancel();
    } catch (e) {
      debugPrint("Error pausing recording: $e");
    }
    notifyListeners();
  }

  void resumeRecording() async {
    try {
      await recorderController.record();
      isPlaying = !isPlaying;
      isPaused = !isPaused;

      _waveformTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!isPaused) {
          _elapsedTime += const Duration(seconds: 1);
          notifyListeners();
        }
      });
    } catch (e) {
      debugPrint("Error resuming recording: $e");
    }
  }

  void deleteRecording() async {
    await recorderController.stop();
    recordingPath = null;
    isRecording = false;
    notifyListeners();
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    recorderController.dispose();
    _waveformTimer?.cancel();
    super.dispose();
  }
}
