import 'package:caffe_sheger/controllers/recomended_product_controller.dart';
import 'package:caffe_sheger/features/presentation/page/food_details/popular_food.dart';
import 'package:caffe_sheger/features/presentation/page/food_details/recommended_food.dart';
import 'package:caffe_sheger/features/presentation/page/home/components/small_card_for_listing.dart';
import 'package:caffe_sheger/features/presentation/widget/BigText.dart';
import 'package:caffe_sheger/features/presentation/widget/SmalText.dart';
import 'package:caffe_sheger/features/presentation/widget/text_with_icon.dart';
import 'package:caffe_sheger/features/utils/app_colors.dart';
import 'package:caffe_sheger/features/utils/app_constants.dart';
import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedFoodList extends StatefulWidget {
  const RecommendedFoodList({Key? key}) : super(key: key);

  @override
  State<RecommendedFoodList> createState() => _RecommendedFoodListState();
}

class _RecommendedFoodListState extends State<RecommendedFoodList> {
  @override
  Widget build(BuildContext context) {
    return         GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
      return recommendedProduct.isLoaded? ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: recommendedProduct.recommendedProductList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Get.to(()=>PopularFoodDetail(productModel: recommendedProduct.recommendedProductList[index]
                ),transition: Transition.leftToRightWithFade,duration: Duration(milliseconds: 800));
              },

              child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  children: [
                    Container(
                      margin:  EdgeInsets.only(bottom: 7),
                      height: Dimensions.listViewIMG,
                      width: Dimensions.listViewIMG,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.width10),
                          color: Colors.amber,
                          image:  DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(AppConstants.IMAGE_URL+recommendedProduct.recommendedProductList[index].img!)
                          )),
                    ),
                    Expanded(
                      child: Container(
                        //height: Dimensions.listViewTextView,
                        width: Dimensions.listViewTextView,

                        margin: EdgeInsets.only(bottom: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.width10),
                                bottomRight:
                                Radius.circular(Dimensions.width10)),
                            color: Colors.white30),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10),
                          child: CardList(product:recommendedProduct.recommendedProductList[index]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }):CircularProgressIndicator(
        color: AppColors.mainColor,
      );
    });
  }
}

