import 'package:caffe_sheger/controllers/popular_product_controller.dart';
import 'package:caffe_sheger/controllers/recomended_product_controller.dart';
import 'package:caffe_sheger/features/presentation/page/home/components/popular_food_details.dart';
import 'package:caffe_sheger/features/presentation/widget/BigText.dart';
import 'package:caffe_sheger/features/presentation/widget/SmalText.dart';
import 'package:caffe_sheger/features/utils/app_colors.dart';
import 'package:caffe_sheger/features/utils/app_constants.dart';
import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:caffe_sheger/model/product_model.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/text_with_icon.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Slider Section
       GetBuilder<PopularProductController>(builder: (popularProducts){
         return popularProducts.isLoaded?Container(
           height: Dimensions.pageView,
           child: GestureDetector(
             onTap: (){
               Get.to(()=>PopularFoodDetail());
             },
             child: PageView.builder(

                 controller: pageController,
                 itemCount: popularProducts.popularProductList.length,
                 itemBuilder: (context, position) {
                   return _buildPageItem(position,popularProducts.popularProductList[position]);
                 }),
           ),
         ):CircularProgressIndicator(
           color: AppColors.mainColor,
         );
       }),
        //Dots Section
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.length<=0?1:popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //Popular Sectios
        SizedBox(
          height: Dimensions.margin30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.margin30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: "Popular",
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                child: SmallText(text: "Food pairing"),
              )
            ],
          ),
        ),
        //List of foods and immages
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommendedProduct.recommendedProductList.length,
              itemBuilder: (context, index) {
                return Container(
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  text:
                                  recommendedProduct.recommendedProductList[index].name,
                                  size: Dimensions.fontSize20,
                                  color: AppColors.mainColor,
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                SmallText(
                                  text: recommendedProduct.recommendedProductList[index].description,
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWithIcon(
                                      text: "Time ",
                                      icon: Icons.circle,
                                      iconColor: Colors.yellow,
                                      iconSize: Dimensions.icon26,
                                      textSize: Dimensions.fontSize12,
                                      textColor: AppColors.textColor,
                                    ),
                                    TextWithIcon(
                                      text: recommendedProduct.recommendedProductList[index].location,
                                      icon: Icons.location_on,
                                      iconColor: Colors.green,
                                      textColor: AppColors.textColor,
                                      iconSize: Dimensions.icon26 - 3,
                                      textSize: Dimensions.fontSize12,
                                    ),
                                    TextWithIcon(
                                      text: "",
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
                      ),
                    ],
                  ),
                );
              }):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProductList) {
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
          Align(
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
                      image: NetworkImage(AppConstants.BASE_URL+"/uploads/"+popularProductList.img!))),
            ),
          ),
          Align(
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
                      text: popularProductList.name!,
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
                          text: popularProductList.createdAt!,
                          icon: Icons.circle,
                          iconColor: Colors.yellow,
                          iconSize: Dimensions.icon26,
                          textSize: Dimensions.fontSize12,
                          textColor: AppColors.textColor,
                        ),
                        TextWithIcon(
                          text: popularProductList.location!,
                          icon: Icons.location_on,
                          iconColor: Colors.green,
                          textColor: AppColors.textColor,
                          iconSize: Dimensions.icon26 - 3,
                          textSize: Dimensions.fontSize12,
                        ),
                        TextWithIcon(
                          text: popularProductList.createdAt!,
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
          ),
        ],
      ),
    );
  }
}

//1.23.58 Stoped Here
//1.56.48 Stoped here
