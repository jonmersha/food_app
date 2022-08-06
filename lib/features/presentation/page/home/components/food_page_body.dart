import 'package:caffe_sheger/features/presentation/widget/BigText.dart';
import 'package:caffe_sheger/features/presentation/widget/SmalText.dart';
import 'package:caffe_sheger/features/utils/app_colors.dart';
import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
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
        print(_currPageValue.toString());
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
      children: [
        //Slider Section
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        //Dots Section
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
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
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 7),
                      height: Dimensions.listViewIMG,
                      width: Dimensions.listViewIMG,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.width10),
                          color: Colors.amber,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/image/food${index + 1}.png"))),
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
                                    "Nutritious fruits in Chinavabd many more",
                                size: Dimensions.fontSize20,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              SmallText(
                                text: "With Chines characterstics",
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    text: "1.7KM",
                                    icon: Icons.location_on,
                                    iconColor: Colors.green,
                                    textColor: AppColors.textColor,
                                    iconSize: Dimensions.icon26 - 3,
                                    textSize: Dimensions.fontSize12,
                                  ),
                                  TextWithIcon(
                                    text: "32min",
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
            })
      ],
    );
  }

  Widget _buildPageItem(int index) {
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
              alignment: Alignment.topCenter,
              height: Dimensions.pageViewContainer,
              padding: EdgeInsets.all(Dimensions.padding10),
              margin: EdgeInsets.only(
                  left: Dimensions.padding10,
                  right: Dimensions.padding10,
                  top: Dimensions.padding10 / 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: index.isEven ? Color(0XFF69c5df) : Color(0XFF69c500),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/food${index + 1}.png"))),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewContainer / 1.3,
              padding: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              margin: EdgeInsets.only(
                  left: Dimensions.margin30,
                  right: Dimensions.margin30,
                  bottom: Dimensions.margin30),
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
                width: double.infinity,
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.height15,
                    right: Dimensions.height15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: "Chinese Side",
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
                                    size: Dimensions.icon26,
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
                          text: "Normal",
                          icon: Icons.circle,
                          iconColor: Colors.yellow,
                          iconSize: Dimensions.icon26,
                          textSize: Dimensions.fontSize12,
                          textColor: AppColors.textColor,
                        ),
                        TextWithIcon(
                          text: "1.7KM",
                          icon: Icons.location_on,
                          iconColor: Colors.green,
                          textColor: AppColors.textColor,
                          iconSize: Dimensions.icon26 - 3,
                          textSize: Dimensions.fontSize12,
                        ),
                        TextWithIcon(
                          text: "32min",
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
