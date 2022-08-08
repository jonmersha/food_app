import 'package:caffe_sheger/controllers/popular_product_controller.dart';
import 'package:caffe_sheger/features/presentation/page/home/components/recomended_list.dart';
import 'package:caffe_sheger/features/presentation/page/home/components/top_slide.dart';
import 'package:caffe_sheger/features/presentation/widget/BigText.dart';
import 'package:caffe_sheger/features/presentation/widget/SmalText.dart';
import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  //PageController pageController = PageController(viewportFraction: 0.85);

  //var _currPageValue = 0.0;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TopSlide(),
        //Dots Section

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
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(text: "Food pairing")
            ],
          ),
        ),
        //List of foods and immages
        const RecommendedFoodList()
      ],
    );
  }

}

//1.23.58 Stoped Here
//1.56.48 Stoped here
