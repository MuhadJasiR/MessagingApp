import 'dart:typed_data';

import 'package:chat_app/core/const_size.dart';
import 'package:chat_app/core/theme.dart';
import 'package:chat_app/presentation/provider/chat_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class PickedFileWidget extends StatelessWidget {
  const PickedFileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<ChatProvider>(context);
    return GestureDetector(
      onTap: () async {
        provider.openFile(context);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: size.width - 60,
          child: Card(
            elevation: 5,
            shadowColor: DefaultColors.greyColor50,
            color: DefaultColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: DefaultColors.orangeColor,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      provider.selectedFileType ?? "Unknown",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  kWidth(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.selectedFileName ?? "Name not mentioned",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(formatFileSize(provider.selectedFileSize)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String formatFileSize(Uint8List bytes) {
  // Get the size in bytes
  int byteSize = bytes.lengthInBytes;

  // Convert to KB or MB
  if (byteSize < 1024) {
    return "$byteSize bytes";
  } else if (byteSize < 1024 * 1024) {
    // Convert to KB
    double kbSize = byteSize / 1024;
    return "${kbSize.toStringAsFixed(2)} KB";
  } else {
    // Convert to MB
    double mbSize = byteSize / (1024 * 1024);
    return "${mbSize.toStringAsFixed(2)} MB";
  }
}
