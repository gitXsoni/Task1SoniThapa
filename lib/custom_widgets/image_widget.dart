import 'package:flutter/material.dart';
import '../core/consts/app_color.dart';
import '../core/themes/text_style.dart';
import '../model/api_data.dart';

class ImageWidget extends StatelessWidget {
  final DataModel data;
  final String displayType;
  const ImageWidget({
    Key? key,
    required this.data,
    required this.displayType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String textToDisplay = '';
    if (displayType == 'duration') {
      textToDisplay = '${data.duration} min';
    } else if (displayType == 'lessons') {
      textToDisplay = '${data.lesson} lessons';
    }

    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 25, bottom: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Image.asset(
                "assets/exercise.png",
                fit: BoxFit.fill,
              ),
            ),
            Text(
              data.category.toUpperCase(),
              style: MyTextStyles.normalTextStyle
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.055,
              child: Text(
                data.name,
                style: MyTextStyles.titleStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textToDisplay,
                  style: MyTextStyles.normalTextStyle
                      .copyWith(color: AppColor.greyColor),
                ),
                if (data.locked == false)
                  Icon(
                    Icons.lock_outline,
                    color: AppColor.greyColor,
                  )
                else
                // Icon(Icons.lock_open_outlined, color: AppColor.greyColor,)
                  Text(
                    data.createdAt,
                    style: MyTextStyles.smallSizeStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
