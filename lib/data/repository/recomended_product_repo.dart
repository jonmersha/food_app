import 'package:caffe_sheger/data/api/api_client.dart';
import 'package:caffe_sheger/features/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService{
  final ApIClient apIClient;

  RecommendedProductRepo({required this.apIClient});

  Future<Response> getRecommendedProductList() async{
    return await apIClient.getData(AppConstants.RECOMENDED_PRODUCT_URI);

  }
}