import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class SendAsChatOrOrderButton extends StatelessWidget {
  const SendAsChatOrOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          icon: Icon(
            Icons.send_outlined,
            color: DefaultColors.blueColor,
          ),
          onPressed: () {},
          label: Text(
            "Send as Chat",
            style: TextStyle(
                color: DefaultColors.blueColor, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(DefaultColors.blueColor100)),
        ),
        ElevatedButton.icon(
          icon: const Icon(
            Icons.blinds_outlined,
            color: DefaultColors.greenColor,
          ),
          onPressed: () {},
          label: const Text(
            "Send as Order",
            style: TextStyle(
                color: DefaultColors.greenColor, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(DefaultColors.greenColor100)),
        )
      ],
    );
  }
}
