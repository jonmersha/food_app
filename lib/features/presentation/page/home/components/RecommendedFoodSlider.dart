import 'package:caffe_sheger/controllers/popular_product_controller.dart';
import 'package:caffe_sheger/controllers/recomended_product_controller.dart';
import 'package:caffe_sheger/features/presentation/page/food_details/RecommendedFoodDetail.dart';
import 'package:caffe_sheger/features/presentation/page/home/components/small_card.dart';
import 'package:caffe_sheger/features/presentation/page/food_details/PopularFoodDetail.dart';
import 'package:caffe_sheger/features/presentation/widget/BigText.dart';
import 'package:caffe_sheger/features/presentation/widget/SmalText.dart';
import 'package:caffe_sheger/features/presentation/widget/text_with_icon.dart';
import 'package:caffe_sheger/features/utils/app_colors.dart';
import 'package:caffe_sheger/features/utils/app_constants.dart';
import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:caffe_sheger/model/product_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedFoodSlider extends StatefulWidget {
  const RecommendedFoodSlider({Key? key}) : super(key: key);
  @override
  State<RecommendedFoodSlider> createState() => _RecommendedFoodSliderState();
}

class _RecommendedFoodSliderState extends State<RecommendedFoodSlider> {

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactors = 0.8;
  final double _height = Dimensions.pageViewContainer;


  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return        Column(
      children: [
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?Container(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: recommendedProduct.recommendedProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, recommendedProduct.recommendedProductList[position],recommendedProduct);
                }),
          ):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return DotsIndicator(
            dotsCount: recommendedProduct.recommendedProductList.isEmpty?1:recommendedProduct.recommendedProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel productModel,RecommendedProductController recommendedProductController) {
    //Scalling while sliding
    Matrix4 matrix4 = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactors);
      var currentTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactors + (_currPageValue - index + 1) * (1 - _scaleFactors);
      var currentTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactors);
      var currentTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1);
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactors) / 2, 1);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Get.to(()=>RecommendedFoodDetail(productModel: productModel,recommendedProductController: recommendedProductController),
                  transition: Transition.leftToRightWithFade,duration: Duration(milliseconds: 800));
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                // alignment: Alignment.topCenter,
                height: Dimensions.pageViewContainer,
                padding: EdgeInsets.only(
                    left: Dimensions.padding10,
                    right: Dimensions.padding10,
                    top: Dimensions.padding10 ),
                margin: EdgeInsets.only(
                    left: Dimensions.padding10,
                    right: Dimensions.padding10,
                    top: Dimensions.padding10 ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: index.isEven ? Color(0XFF69c5df) : Color(0XFF69c500),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(AppConstants.IMAGE_URL+productModel.img!))),
              ),
            ),
          ),
         // SmallCard(productmodel: popularProductList)
          SmallCard(productList: recommendedProductController.recommendedProductList[index])
        ],
      ),
    );
  }

}
