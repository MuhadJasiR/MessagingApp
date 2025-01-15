import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:chat_app/core/const_size.dart';
import 'package:chat_app/core/theme.dart';
import 'package:chat_app/presentation/chat/chat_screen.dart';
import 'package:chat_app/presentation/provider/chat_provider.dart';

import 'package:chat_app/presentation/provider/record_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool isRecording = false;
bool isPlaying = false;
bool isPaused = false;
String? recordingPath;

class ChatInputWidget extends StatelessWidget {
  const ChatInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecordProvider(),
      child: Consumer2<RecordProvider, ChatProvider>(
        builder: (context, recordProvider, chatProvider, _) {
          return ValueListenableBuilder<bool?>(
            valueListenable: sendAsChatOrOrderNotifier,
            builder: (context, value, child) => Padding(
              padding: EdgeInsets.only(
                  top: 5,
                  bottom: sendAsChatOrOrderNotifier.value == false ? 25 : 5,
                  left: 15,
                  right: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 60,
                child: recordProvider.isRecording
                    ? WhileRecording(
                        recordProvider: recordProvider,
                      )
                    : RecordingWidget(
                        recordProvider: recordProvider,
                        chatProvider: chatProvider,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecordingWidget extends StatelessWidget {
  RecordingWidget(
      {super.key, required this.recordProvider, required this.chatProvider});

  RecordProvider recordProvider;
  ChatProvider chatProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(18),
            ),
            child: TextField(
              controller: TextEditingController(),
              onSubmitted: (value) {},
              decoration: const InputDecoration(
                hintText: "Type here...",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: chatProvider.pickFile,
          icon: const Icon(
            Icons.attach_file,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: recordProvider.startRecording,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(17)),
            child: Icon(
              recordProvider.isRecording ? Icons.stop : Icons.mic,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class WhileRecording extends StatelessWidget {
  WhileRecording({super.key, required this.recordProvider});
  RecordProvider recordProvider;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        recordProvider.isPaused
            ? GestureDetector(
                onTap: recordProvider.resumeRecording,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: DefaultColors.greyColor100,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(Icons.pause),
                ),
              )
            : GestureDetector(
                onTap: recordProvider.stopRecording,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: DefaultColors.blueColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(
                    Icons.send,
                    color: DefaultColors.whiteColor,
                  ),
                ),
              ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AudioWaveforms(
                size: const Size(200, 25),
                recorderController: recordProvider.recorderController,
                waveStyle: const WaveStyle(
                  waveColor: Colors.red,
                  extendWaveform: true,
                  showMiddleLine: false,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: DefaultColors.redColor,
                    size: 7,
                  ),
                  kWidth(5),
                  Text(
                    recordProvider.formatDuration(recordProvider.elapsedTime),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
        recordProvider.isPaused
            ? const SizedBox()
            : GestureDetector(
                onTap: recordProvider.pauseRecording,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: DefaultColors.blackColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Icon(
                    Icons.play_arrow,
                    color: DefaultColors.whiteColor,
                  ),
                ),
              ),
        recordProvider.isPaused ? kWidth(0) : kWidth(5),
        GestureDetector(
          onTap: recordProvider.deleteRecording,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: DefaultColors.redColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)),
            child: const Icon(
              Icons.delete_outline_rounded,
              color: DefaultColors.redColor,
            ),
          ),
        ),
      ],
    );
  }
}
