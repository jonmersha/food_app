import 'package:caffe_sheger/controllers/popular_product_controller.dart';
import 'package:caffe_sheger/controllers/recomended_product_controller.dart';
import 'package:caffe_sheger/features/presentation/page/food_details/PopularFoodDetail.dart';
import 'package:caffe_sheger/features/presentation/page/food_details/RecommendedFoodDetail.dart';
import 'package:caffe_sheger/features/presentation/page/home/components/small_card_for_listing.dart';
import 'package:caffe_sheger/features/presentation/widget/SmalText.dart';
import 'package:caffe_sheger/features/presentation/widget/text_with_icon.dart';
import 'package:caffe_sheger/features/utils/app_colors.dart';
import 'package:caffe_sheger/features/utils/app_constants.dart';
import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularFoodList extends StatefulWidget {
  const PopularFoodList({Key? key}) : super(key: key);

  @override
  State<PopularFoodList> createState() => _PopularFoodListState();
}

class _PopularFoodListState extends State<PopularFoodList> {
  @override
  Widget build(BuildContext context) {
    return         GetBuilder<PopularProductController>(builder: (popularProduct){
      return popularProduct.isLoaded? ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: popularProduct.popularProductList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Get.to(()=>PopularFoodDetail(productModel: popularProduct.popularProductList[index], popularProductController: popularProduct,
                ),transition: Transition.leftToRightWithFade,duration: const Duration(milliseconds: 800));
              },

              child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  children: [
                    Container(
                      margin:  const EdgeInsets.only(bottom: 7),
                      height: Dimensions.listViewIMG,
                      width: Dimensions.listViewIMG,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.width10),
                          color: Colors.amber,
                          image:  DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(AppConstants.IMAGE_URL+popularProduct.popularProductList[index].img!)
                          )),
                    ),
                    Expanded(
                      child: Container(
                        //height: Dimensions.listViewTextView,
                        width: Dimensions.listViewTextView,

                        margin: const EdgeInsets.only(bottom: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.width10),
                                bottomRight:
                                Radius.circular(Dimensions.width10)),
                            color: Colors.white30),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10),
                          child: CardList(product:popularProduct.popularProductList[index]),
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

