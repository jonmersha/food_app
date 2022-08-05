import 'package:caffe_sheger/features/presentation/widget/text_with_icon.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimensions.dart';
import 'BigText.dart';
import 'SmalText.dart';

class AppColum extends StatelessWidget {
  final String headerText;
  const AppColum({Key? key, required this.headerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: this.headerText,
          size: Dimensions.fontSize20,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    size: Dimensions.icon26,
                    color: Colors.green,
                  )),
            ),
            const SizedBox(
              width: 5,
            ),
            SmallText(
              text: "4.5",
              size: Dimensions.fontSize12,
            ),
            const SizedBox(
              width: 5,
            ),
            SmallText(
              text: "127",
              size: Dimensions.fontSize12,
            ),
            const SizedBox(
              width: 5,
            ),
            SmallText(
              text: "Comments",
              size: Dimensions.fontSize11,
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWithIcon(
              text: "Normal",
              icon: Icons.circle,
              iconColor: Colors.yellow,
              iconSize: Dimensions.icon26,
              textSize: Dimensions.fontSize12,
              textColor: AppColors.textColor,
            ),
            TextWithIcon(
              text: "1.7KM",
              icon: Icons.location_on,
              iconColor: Colors.green,
              textColor: AppColors.textColor,
              iconSize: Dimensions.icon26 - 3,
              textSize: Dimensions.fontSize12,
            ),
            TextWithIcon(
              text: "32min",
              icon: Icons.timelapse,
              iconColor: Colors.green,
              textColor: AppColors.textColor,
              iconSize: Dimensions.icon26 - 3,
              textSize: Dimensions.fontSize12,
            ),
          ],
        )
      ],
    );
  }
}
