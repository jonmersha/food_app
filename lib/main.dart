import 'package:caffe_sheger/controllers/popular_product_controller.dart';
import 'package:caffe_sheger/controllers/recomended_product_controller.dart';
import 'package:caffe_sheger/features/presentation/page/food_details/recommended_food.dart';
import 'package:caffe_sheger/features/presentation/page/home/main_food_page.dart';
import 'package:caffe_sheger/route/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: const MainFoodPage(),
      initialRoute: RouteHelper.initial,
    );
  }
}
