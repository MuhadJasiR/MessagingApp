import 'package:chat_app/core/const_size.dart';
import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Message",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 5),
            child:
                Text("Recent", style: Theme.of(context).textTheme.bodyMedium),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRectangleContact("Usman", context),
                _buildRectangleContact("khader", context),
                _buildRectangleContact("Muhammed", context),
                _buildRectangleContact("Jasir", context),
                _buildRectangleContact("Fathima", context),
                _buildRectangleContact("annie", context),
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: DefaultColors.messageListInput),
            child: ListView(
              children: [
                _buildMessageTile("Unais", "Nothing", "8:00"),
                _buildMessageTile("Unais", "Nothing", "8:00"),
                _buildMessageTile("Unais", "Nothing", "8:00"),
                _buildMessageTile("Unais", "Nothing", "8:00"),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildMessageTile(String name, String message, String time) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: const CircleAvatar(
        radius: 30,
      ),
      title: Text(
        name,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(color: Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        time,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }

  Padding _buildRectangleContact(String name, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 30,
          ),
          kHeight(5),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
