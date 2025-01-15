import 'package:chat_app/core/theme.dart';
import 'package:chat_app/presentation/auth/login_screen.dart';
import 'package:chat_app/presentation/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ChatApp",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: const Text(
                      "are you sure want to logout?",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setBool("isLoggedIn", false);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(color: Colors.red),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("No"))
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        BottomNavigationBarItem(
            icon: Icon(Icons.space_dashboard_outlined), label: "status"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChatScreen(),
                )),
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGmt7mgLLJbU_An415Sur0-Iq8kRKQzzAwCw&s"),
                ),
                title: const Text(
                  "Michael Knight",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Online",
                  style: TextStyle(color: DefaultColors.greenColor),
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_vert_sharp)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
