import 'package:caffe_sheger/features/presentation/widget/BigText.dart';
import 'package:caffe_sheger/features/presentation/widget/SmalText.dart';
import 'package:caffe_sheger/features/presentation/widget/app_icon.dart';
import 'package:caffe_sheger/features/utils/app_colors.dart';
import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../widget/app_colum.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImageSize,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/food1.png")),
                    color: Colors.amber),
              )),
          //BigText(text: "Ads",)
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    iconData: Icons.arrow_back_ios,
                    iconColor: Colors.white30,
                    backGroundColor: AppColors.mainBackColor,
                  ),
                  AppIcon(
                      iconData: Icons.shopping_cart_outlined,
                      iconColor: Colors.white30,
                      backGroundColor: AppColors.mainBackColor)
                ],
              )),

          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImageSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColum(
                      headerText: "this Is the Headr Text",
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: 10,
                    ),
                    SmallText(
                      text:
                          "Check Marinated with spiced yughort is placed in the large por, and then layered with fried onion(Cheeky easy sub below), fresh coriander/clantro. then par boiled ",
                      size: Dimensions.fontSize12,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "Show more",
                          color: AppColors.mainColor,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColors.mainColor,
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: Container(
          height: 120,
          padding: EdgeInsets.only(
              top: Dimensions.height20, bottom: Dimensions.height20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: AppColors.buttonBackGroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.remove,color: AppColors.singleColor,),
                    SizedBox(width: 10,),
                    BigText(text: "0",),
                    SizedBox(width: 10,),

                    Icon(Icons.add),

                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: SmallText(
                  text: "\$\ 0.0 Add to Cart",
                  size: 20,
                  color: Colors.black,
                ),
              )
            ],
          )),
    );
  }
}
