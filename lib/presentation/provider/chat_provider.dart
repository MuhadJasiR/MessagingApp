import 'dart:io';
import 'dart:typed_data';
import 'package:chat_app/presentation/chat/chat_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:open_file/open_file.dart';

class ChatProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _chatMessages = [];

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  final AudioPlayer audioPlayer = AudioPlayer();
  String? selectedFileName;
  String? selectedFileType;
  File? savedFile;
  Uint8List selectedFileSize =
      Uint8List.fromList(List.generate(2500, (index) => index % 256));
  String? selectedFilePath;
  List<Map<String, dynamic>> get chatMessages => _chatMessages;

  void addMessage(Map<String, dynamic> message) {
    _chatMessages.add(message);
    notifyListeners();
  }

  ChatProvider() {
    initializeAudioPlayer();
  }

  String? _filePath;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      _filePath = result.files.single.path;
      selectedFileName = file.name;
      selectedFilePath = file.path;
      selectedFileSize = file.bytes ??
          Uint8List.fromList(List.generate(2500, (index) => index % 256));
      selectedFileType = file.extension;
      notifyListeners();
    } else {
      _filePath = null;
      notifyListeners();
    }
  }

  void openFile(BuildContext context) {
    if (_filePath != null) {
      OpenFile.open(_filePath!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No file selected')),
      );
    }
  }

  void initializeAudioPlayer() {
    audioPlayer.positionStream.listen((p) {
      position = p;
      notifyListeners();
    });

    audioPlayer.durationStream.listen((d) {
      duration = d ?? Duration.zero;
      notifyListeners();
    });

    audioPlayer.playerStateStream.listen(
      (state) {
        if (state.processingState == ProcessingState.completed) {
          position = Duration.zero;
          isPlaying = false;
          notifyListeners();
          audioPlayer.pause();
          audioPlayer.seek(position);
        }
      },
    );
  }

  void setRecordingPath(String path) {
    recordingPath = path;
    notifyListeners();
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
  }

  Future<void> handlePlayPause() async {
    if (audioPlayer.playing) {
      await audioPlayer.stop();
      isPlaying = false;
    } else if (recordingPath != null) {
      await audioPlayer.setFilePath(recordingPath!);
      audioPlayer.play();
      isPlaying = true;
    }
    notifyListeners();
  }

  void handleSeek(double value) {
    audioPlayer.seek(Duration(seconds: value.toInt()));
    notifyListeners();
  }

  void initializePlayer() {
    audioPlayer.positionStream.listen((p) {
      position = p;
      notifyListeners();
    });
    audioPlayer.durationStream.listen((d) {
      duration = d ?? Duration.zero;
      notifyListeners();
    });
    audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        position = Duration.zero;
        audioPlayer.pause();
        audioPlayer.seek(position);
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
