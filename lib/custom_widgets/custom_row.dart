import 'package:flutter/material.dart';

import '../core/consts/app_color.dart';
import '../core/themes/text_style.dart';

class CustomRow extends StatelessWidget {
  String? text;
  CustomRow({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text!,
            style: MyTextStyles.headerStyle.copyWith(fontSize: 18),
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  "View All",
                  style: MyTextStyles.headerStyle
                      .copyWith(color: AppColor.greyColor, fontSize: 12),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: AppColor.greyColor,
                  size: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
