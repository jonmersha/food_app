import 'package:caffe_sheger/features/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Container(
              child: Row(
                children: [
                  ElevatedButton(onPressed: (){}, child: Text("Buttone 1"))

                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child:Container(
                color: Colors.white,
                width: double.maxFinite,
                height: 50,
                alignment: Alignment.center,
                child: Text("theis Sliver tEst demo"),
              )
            ),
            pinned: true,
            backgroundColor: Colors.amber,
            expandedHeight: Dimensions.height300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food1.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),

SliverToBoxAdapter(
  child: Text("The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used toThe declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to The declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used toThe declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used toThe declaration of m in B is a candidate because it’s missing both the return type and the parameter type. Because it overrides a single method (the method m in A), the types from the overridden method will be used to"),

)
        ],

      )
    );
  }
}
