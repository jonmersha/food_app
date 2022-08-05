import 'package:caffe_sheger/features/presentation/widget/SmalText.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../widget/BigText.dart';
import 'components/food_page_body.dart';

class MainFoofPage extends StatefulWidget {
  const MainFoofPage({Key? key}) : super(key: key);

  @override
  State<MainFoofPage> createState() => _MainFoofPageState();
}

class _MainFoofPageState extends State<MainFoofPage> {
  @override
  Widget build(BuildContext context) {
    print("Current Screen Size "+MediaQuery.of(context).size.height.toString());
    return Scaffold(
        body: Column(
      children: [
        //Showing the header
        Container(
          child: Container(
            margin: const EdgeInsets.only(top: 45, bottom: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children:  [
                    BigText(
                      color:AppColors.mainColor,
                      text:"Bangladesh",
                      size: 20,),
                    Row(
                      children: [
                        SmallText(text: "Addis Ababa",color: Colors.black54,),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )],
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      // Showing the Body
        Expanded(
            child: SingleChildScrollView(
                child: FoodPageBody(),
            ),
        ),

      ],
    ));
  }
}
