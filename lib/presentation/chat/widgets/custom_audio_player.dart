import 'package:chat_app/core/theme.dart';
import 'package:chat_app/presentation/provider/chat_provider.dart';
import 'package:flutter/material.dart';

class CustomAudioPlayer extends StatelessWidget {
  final ChatProvider chatProvider;

  const CustomAudioPlayer({required this.chatProvider, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        color: DefaultColors.blueColor50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: 260,
        child: Row(
          children: [
            GestureDetector(
              onTap: chatProvider.handlePlayPause,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: DefaultColors.whiteColor,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: chatProvider.isPlaying
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Slider(
                    activeColor: DefaultColors.blueColor,
                    inactiveColor: DefaultColors.whiteColor,
                    min: 0.0,
                    max: chatProvider.duration.inSeconds.toDouble(),
                    value: chatProvider.position.inSeconds.toDouble().clamp(
                          0.0,
                          chatProvider.duration.inSeconds.toDouble(),
                        ),
                    onChanged: chatProvider.handleSeek,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Text(
                          chatProvider.formatDuration(chatProvider.position),
                          style: const TextStyle(
                              fontSize: 10, color: DefaultColors.greyColor),
                        ),
                        const Spacer(),
                        Text(
                          chatProvider.formatDuration(chatProvider.duration),
                          style: const TextStyle(
                              fontSize: 10, color: DefaultColors.greyColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
