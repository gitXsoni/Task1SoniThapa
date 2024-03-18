import 'package:flutter/material.dart';
import 'package:task1/themes/app_color.dart';
import 'package:task1/themes/text_style.dart';

class ContainerWidget extends StatelessWidget {
  String? textName;
  Icon? firstIcon;
  ContainerWidget({super.key, this.firstIcon, this.textName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.43,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.secondaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: firstIcon!,
                color: AppColor.secondaryColor,
              ),
              Text(
                textName!,
                style: MyTextStyles.normalTextStyle
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              )
            ],
          ),
        ),
      ),
    );
  }
}
