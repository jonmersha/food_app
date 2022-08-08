import 'package:caffe_sheger/features/presentation/widget/BigText.dart';
import 'package:caffe_sheger/features/presentation/widget/app_icon.dart';
import 'package:caffe_sheger/features/presentation/widget/expandable_text.dart';
import 'package:caffe_sheger/features/utils/app_colors.dart';
import 'package:caffe_sheger/features/utils/app_constants.dart';
import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:caffe_sheger/model/product_model.dart';
import 'package:caffe_sheger/route/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/main_food_page.dart';


class RecommendedFoodDetail extends StatelessWidget {
  final ProductModel productModel;
  const RecommendedFoodDetail({Key? key, required this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      //Get.to(()=>const MainFoodPage());
                      Get.to(()=>MainFoodPage(),transition: Transition.rightToLeftWithFade,duration: Duration(milliseconds: 800));

                    },
                      child: AppIcon(iconData: Icons.clear,backGroundColor: AppColors.mainColor,)
                  ),
                  AppIcon(iconData: Icons.shopping_cart_outlined,),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child:Container(
                width: double.maxFinite,
                height: 50,
                alignment: Alignment.center,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20)
                    ),
                  color: Colors.white
                ),

                child:  BigText(text: productModel.name!,size: Dimensions.fontSize26, ),
              )
            ),
            pinned: true,
            backgroundColor: Colors.amber,
            expandedHeight: Dimensions.height200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  AppConstants.IMAGE_URL+productModel.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,

              )
            ),
          ),
          SliverToBoxAdapter(

  child: Column(
    children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
          child:  ExpandableTextWidget(
              text: productModel.description!)
      ),
    ],
  ),

)
        ],

      ),
          bottomNavigationBar:

          NewBottomBarr(),
    );
  }
}

class NewBottomBarr extends StatelessWidget {
  const NewBottomBarr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:[
        Container(

          padding: EdgeInsets.only(
            left: Dimensions.width20*2.5,
            right: Dimensions.width20*2.5,
            top: Dimensions.height10,
            bottom: Dimensions.height10,

          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                iconSize:Dimensions.iconSize24,
                iconData: Icons.remove,
                backGroundColor: AppColors.mainColor,
                iconColor: Colors.white,),
              BigText(text: "\$ 12.88  X 0", size: 20,color: Colors.black54,),
              AppIcon(
                iconSize:Dimensions.iconSize24,
                iconData: Icons.add,
                backGroundColor: AppColors.mainColor,
                iconColor: Colors.white,)

            ],
          ),
        ),
        Container(
          height: Dimensions.height100,
          padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
             left: Dimensions.height20,
              right: Dimensions.height20,

          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20*2),
              topRight: Radius.circular(Dimensions.radius20*2)
            ),
            color: Color(0xFFCACACEFF)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height20),
                  color: Colors.white
                ),
                child: Icon(Icons.favorite,color: AppColors.mainColor,size: 30,),
              ),
              Container(
                padding: EdgeInsets.all(Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.height20),
                    color: AppColors.mainColor
                ),
                child: BigText(text: "\$ 28 | Add to cart",color: Colors.white,),
              ),
            ],
          ),
        )

      ]

    );
  }
}
