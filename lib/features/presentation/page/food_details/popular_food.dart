import 'package:caffe_sheger/controllers/popular_product_controller.dart';
import 'package:caffe_sheger/features/presentation/page/food_details/components/bottom_bar.dart';
import 'package:caffe_sheger/features/presentation/page/home/main_food_page.dart';
import 'package:caffe_sheger/features/presentation/widget/BigText.dart';
import 'package:caffe_sheger/features/presentation/widget/app_colum.dart';
import 'package:caffe_sheger/features/presentation/widget/app_icon.dart';
import 'package:caffe_sheger/features/presentation/widget/expandable_text.dart';
import 'package:caffe_sheger/features/utils/app_colors.dart';
import 'package:caffe_sheger/features/utils/app_constants.dart';
import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:caffe_sheger/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final ProductModel productModel;

  const PopularFoodDetail( {Key? key, required this.productModel}) : super(key: key);
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.IMAGE_URL+productModel.img!)
                    ),
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
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>MainFoodPage(),transition: Transition.rightToLeftWithFade,duration: Duration(milliseconds: 800));
                    },
                    child: AppIcon(
                      iconData: Icons.arrow_back_ios,
                      iconColor: Colors.white30,
                      backGroundColor: AppColors.mainBackColor,
                    ),
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
                     AppColum(
                      headerText: productModel.name!,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Expanded(
                        child: SingleChildScrollView(child: ExpandableTextWidget(text:productModel.description!,))),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                  ],
                ),
              )),
        //expandable text widget

        ],
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

