import 'package:caffe_sheger/features/presentation/widget/BigText.dart';
import 'package:caffe_sheger/features/presentation/widget/SmalText.dart';
import 'package:caffe_sheger/features/presentation/widget/app_colum.dart';
import 'package:caffe_sheger/features/presentation/widget/app_icon.dart';
import 'package:caffe_sheger/features/presentation/widget/expandable_text.dart';
import 'package:caffe_sheger/features/utils/app_colors.dart';
import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:flutter/material.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Background Immage
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
          //Icon widgets
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
          //Introduction of the food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImageSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width30,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.height20),
                        topRight: Radius.circular(Dimensions.height20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppColum(
                      headerText: "this Is the Headr Text",
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.height10,
                    ),


                    Expanded(
                        child: SingleChildScrollView(child: const ExpandableTextWidget(text: "I had different issue why IOS simulator was not appearing in fresh installation - dart sdk was not configured. I've clicked run->run there it was showing that dart is not configured, I've added flutter/bin/cache/dart-sdk in config and after that iphone simulator has appeared. Of course I followed other steps: sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer sudo xcodebuild -runFirstLaunch I had different issue why IOS simulator was not appearing in fresh installation - dart sdk was not configured. I've clicked run->run there it was showing that dart is not configured, I've added flutter/bin/cache/dart-sdk in config and after that iphone simulator has appeared. Of course I followed other steps: sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer sudo xcodebuild -runFirstLaunch",))),

                    SizedBox(
                      height: Dimensions.height20,
                    ),

                  ],
                ),
              )),
        //expandable text widget

        ],
      ),
      bottomNavigationBar: Container(
          height: Dimensions.height120,
          padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.height20,
              right: Dimensions.height20),
          decoration: BoxDecoration(
            color: AppColors.buttonBackGroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.height20,
                    right: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.remove,
                      color: AppColors.singleColor,
                    ),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    BigText(
                      text: "0",
                    ),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    const Icon(Icons.add),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.height20,
                    right: Dimensions.height20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                  color: AppColors.mainColor,
                ),
                child: BigText(
                  text: "\$0.0 | Add to Cart",
                  size: Dimensions.fontSize20,
                  color: Colors.white,
                ),
              )
            ],
          )),
    );
  }
}
