import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task1/themes/app_color.dart';
import '../themes/text_style.dart';

class ImageWidget extends StatelessWidget {
  String? imagePath;
  String? heading;
  String? title;
  String? subtitle;
  final bool showBookOption;
  final IconData? iconData;
  ImageWidget(
      {super.key,
      this.heading,
      this.imagePath,
      this.subtitle,
      this.title,
      this.showBookOption = false,this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 25, bottom: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Image.asset(
                imagePath ?? "assets/lifestyle.png",
                fit: BoxFit.fill,
              ),
            ),
            Text(
              heading!,
              style: MyTextStyles.normalTextStyle
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              title!,
              style: MyTextStyles.titleStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtitle!,
                  style: MyTextStyles.normalTextStyle
                      .copyWith(color: AppColor.greyColor),
                ),
                if (showBookOption)
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.secondaryColor),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Book",
                        style: MyTextStyles.normalTextStyle,
                      ),
                    ),
                  ),
                if (!showBookOption && iconData != null)
                  Icon(
                    iconData,
                    color: AppColor.greyColor,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
