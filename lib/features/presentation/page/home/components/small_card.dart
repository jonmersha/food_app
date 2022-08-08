
import 'package:caffe_sheger/features/presentation/widget/BigText.dart';
import 'package:caffe_sheger/features/presentation/widget/SmalText.dart';
import 'package:caffe_sheger/features/presentation/widget/text_with_icon.dart';
import 'package:caffe_sheger/features/utils/app_colors.dart';
import 'package:caffe_sheger/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../utils/dimensions.dart';

class SmallCard extends StatelessWidget {
 final ProductModel productList;
  const SmallCard({Key? key,required this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: Dimensions.height120,
        padding: EdgeInsets.only(
            left: Dimensions.width10,
            right: Dimensions.width10),
        margin: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: Dimensions.margin30
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0xffe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 5)),
              BoxShadow(color: Colors.white, offset: Offset(5, 0))
            ]),
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
              top: Dimensions.height10,
              left: Dimensions.height10,
              right: Dimensions.height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                text: productList.name!,
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
                          size: Dimensions.iconSize24,
                          color: Colors.green,
                        )),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SmallText(
                    text: productList.stars.toString(),
                    size: Dimensions.fontSize12,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SmallText(
                    text: "78",
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
                    text: "Somes",
                    icon: Icons.location_on,
                    iconColor: Colors.green,
                    textColor: AppColors.textColor,
                    iconSize: Dimensions.icon26 - 3,
                    textSize: Dimensions.fontSize12,
                  ),
                  TextWithIcon(
                    text: "Time",
                    icon: Icons.timelapse,
                    iconColor: Colors.green,
                    textColor: AppColors.textColor,
                    iconSize: Dimensions.icon26 - 3,
                    textSize: Dimensions.fontSize12,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    )
    ;
  }
}
