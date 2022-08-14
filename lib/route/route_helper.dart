import 'package:caffe_sheger/features/presentation/page/food_details/PopularFoodDetail.dart';
import 'package:caffe_sheger/features/presentation/page/home/main_food_page.dart';
import 'package:get/get.dart';


class RouteHelper{
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String foodBody = "/food-body";

  static String getInitial()=>'$initial';

  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainFoodPage()),
    GetPage(name: initial, page: (){
      return MainFoodPage();
    }),
    //GetPage(name: recommendedFood, page: ()=>MainFoodPage()),
  ];
}