import 'package:caffe_sheger/features/presentation/widget/BigText.dart';
import 'package:caffe_sheger/features/presentation/widget/app_icon.dart';
import 'package:caffe_sheger/features/presentation/widget/expandable_text.dart';
import 'package:caffe_sheger/features/utils/app_colors.dart';
import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:flutter/material.dart';


class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppIcon(iconData: Icons.clear,),
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

                child:  BigText(text: "Chines Side",size: Dimensions.fontSize26, ),
              )
            ),
            pinned: true,
            backgroundColor: Colors.amber,
            expandedHeight: Dimensions.height200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food1.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(

  child: Column(
    children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
          child: ExpandableTextWidget(
              text:"The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used toThe declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used toThe declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used toThe declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to"
          )
      ),
    ],
  ),

)
        ],

      ),
          bottomNavigationBar: Column(
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

          ),
    );
  }
}
