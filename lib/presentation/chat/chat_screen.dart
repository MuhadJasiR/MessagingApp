import 'package:chat_app/core/const_size.dart';
import 'package:chat_app/core/theme.dart';
import 'package:chat_app/presentation/chat/widgets/audio_card_widget.dart';
import 'package:chat_app/presentation/chat/widgets/chat_input_widget.dart';
import 'package:chat_app/presentation/chat/widgets/custom_audio_player.dart';
import 'package:chat_app/presentation/chat/widgets/filter_button.dart';
import 'package:chat_app/presentation/chat/widgets/picked_file_widget.dart';
import 'package:chat_app/presentation/chat/widgets/send_as_chat_or_order.dart';
import 'package:chat_app/presentation/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String? recordingPath;
ValueNotifier<String?> recordingPathNotifier = ValueNotifier<String?>(null);
ValueNotifier<bool?> sendAsChatOrOrderNotifier = ValueNotifier<bool?>(null);

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return Scaffold(
      backgroundColor: DefaultColors.greyColor50,
      appBar: AppBar(
        backgroundColor: DefaultColors.greyColor50,
        toolbarHeight: 70.0,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGmt7mgLLJbU_An415Sur0-Iq8kRKQzzAwCw&s"),
            ),
            kWidth(10),
            const Text("Michael Knight"),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          const FilterButtonWidget(),
          Expanded(
            child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: SizedBox(height: 260, child: AudioCardUI()),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 145,
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            color: DefaultColors.blueColor50,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                  child: Text(
                                "ok, Got it!",
                                style:
                                    TextStyle(overflow: TextOverflow.ellipsis),
                              )),
                              Text(
                                "12:30 pm",
                                style: TextStyle(fontSize: 9),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  kHeight(10),
                  ValueListenableBuilder<String?>(
                    valueListenable: recordingPathNotifier,
                    builder: (context, recordingPath, child) {
                      return recordingPath != null
                          ? Align(
                              alignment: Alignment.centerRight,
                              child:
                                  CustomAudioPlayer(chatProvider: chatProvider))
                          : const SizedBox();
                    },
                  ),
                  kHeight(10),
                  chatProvider.selectedFileName != null
                      ? const PickedFileWidget()
                      : const SizedBox()
                ]),
          ),
          const ChatInputWidget(),
          ValueListenableBuilder<bool?>(
            valueListenable: sendAsChatOrOrderNotifier,
            builder: (context, value, child) {
              return sendAsChatOrOrderNotifier.value == true
                  ? const SendAsChatOrOrderButton()
                  : const SizedBox();
            },
          )
        ],
      ),
    );
  }
}
