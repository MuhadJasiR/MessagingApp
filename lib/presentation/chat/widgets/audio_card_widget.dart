// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:chat_app/core/const_size.dart';
import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:share_plus/share_plus.dart';

class AudioCardUI extends StatelessWidget {
  AudioCardUI({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onLongPress: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => Container(
              width: 300,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.reorder),
                    title: const Text('Quick Reorder'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_add),
                    title: const Text('Assign to Salesmen'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.share),
                    title: const Text('Share'),
                    onTap: () {
                      Share.share('check out my website https://example.com');
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.file_download),
                    title: const Text('Export'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
        child: Container(
          width: size.width - 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: DefaultColors.greyColor100,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Icon(
                          Icons.play_arrow,
                          color: DefaultColors.blackColor,
                          size: 30,
                        ),
                      ),
                      Expanded(
                        child: Slider(
                          value: 0.0,
                          onChanged: (value) {},
                          activeColor: Colors.blue,
                          inactiveColor: Colors.grey.shade300,
                        ),
                      ),
                      const Text(
                        "01:23",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                const ExpansionTile(
                  minTileHeight: 20,
                  title: Text(
                    "Transcript",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          "Wanted to place an order for a few items. Here's what I need: first, 50 units of the Classic Leather Wallet in black. Next, 30 units of the Summer Floral Dress"),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                const ExpansionTile(
                  minTileHeight: 20,
                  title: Text(
                    "Order List",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.list_alt, size: 20, color: Colors.grey),
                          SizedBox(width: 8),
                          Text("Order No: 15544"),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey.shade300,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          "Approved by DP on 02:30pm, 15/07/2024",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.green,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "V.1",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          "12:38 pm",
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                kHeight(10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
