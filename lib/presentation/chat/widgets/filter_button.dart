import 'package:chat_app/core/const_size.dart';
import 'package:chat_app/core/theme.dart';

import 'package:flutter/material.dart';

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: DefaultColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      offset: Offset(1, 2),
                      color: DefaultColors.greyColor)
                ]),
            height: 50,
            child: Row(
              children: [
                kWidth(10),
                FilterButton(
                  title: "All",
                  bgColor: DefaultColors.blackColor,
                  titleColor: DefaultColors.whiteColor,
                ),
                kWidth(5),
                FilterButton(
                  title: "Unread",
                  bgColor: DefaultColors.greyColor100,
                  titleColor: DefaultColors.blackColor,
                ),
                kWidth(5),
                FilterButton(
                  title: "Approved",
                  bgColor: DefaultColors.greenColor.withOpacity(0.2),
                  titleColor: DefaultColors.greenColor,
                ),
                kWidth(5),
                FilterButton(
                  title: "Declined",
                  bgColor: DefaultColors.redColor.withOpacity(0.2),
                  titleColor: DefaultColors.redColor,
                ),
                kWidth(5),
                FilterButton(
                  title: "Pending",
                  bgColor: DefaultColors.yellowColor.withOpacity(0.2),
                  titleColor: DefaultColors.orangeColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  FilterButton(
      {super.key,
      required this.bgColor,
      required this.title,
      required this.titleColor});

  String title;
  Color titleColor;
  Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title,
          style: TextStyle(color: titleColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
