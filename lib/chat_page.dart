import 'package:chat_app/core/const_size.dart';
import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(),
            kWidth(10),
            Text(
              "Danny Hospinks",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              _buildReceiveMessage(context, "hy"),
              _buildSentMessage(context, "hy.. how are you"),
              _buildReceiveMessage(context, "Doing good"),
              _buildSentMessage(
                  context, "whats plan about your next trip to swiss land"),
            ],
          )),
          _buildMessageInput()
        ],
      ),
    );
  }

  Container _buildMessageInput() {
    return Container(
      decoration: BoxDecoration(
          color: DefaultColors.sentMessageInput,
          borderRadius: BorderRadius.circular(25)),
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          GestureDetector(
            child: const Icon(
              Icons.camera_alt,
              color: Colors.grey,
            ),
            onTap: () {},
          ),
          kWidth(10),
          Expanded(
              child: TextFormField(
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              hintText: "Message",
            ),
            style: const TextStyle(color: Colors.white),
          )),
          kWidth(10),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.send,
                color: Colors.grey,
              ))
        ],
      ),
    );
  }

  Align _buildSentMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: DefaultColors.senderMessage,
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  Align _buildReceiveMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: DefaultColors.receiverMessage,
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
