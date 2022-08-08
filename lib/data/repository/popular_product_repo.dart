import 'package:caffe_sheger/data/api/api_client.dart';
import 'package:caffe_sheger/features/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{
  final ApIClient apIClient;

  PopularProductRepo({required this.apIClient});
  
  Future<Response> getPopularProductList() async{
    return await apIClient.getData(AppConstants.POPULAR_PRODUCT_URI);
    
  }
}