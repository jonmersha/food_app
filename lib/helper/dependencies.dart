import 'package:caffe_sheger/controllers/popular_product_controller.dart';
import 'package:caffe_sheger/controllers/recomended_product_controller.dart';
import 'package:caffe_sheger/data/api/api_client.dart';
import 'package:caffe_sheger/data/repository/popular_product_repo.dart';
import 'package:caffe_sheger/data/repository/recomended_product_repo.dart';
import 'package:caffe_sheger/features/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApIClient(appBaseUrl: AppConstants.BASE_URL));

//repos
  Get.lazyPut(() => PopularProductRepo(apIClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apIClient: Get.find()));

//Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
}
