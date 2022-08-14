import 'package:caffe_sheger/data/repository/popular_product_repo.dart';
import 'package:caffe_sheger/model/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList=>_popularProductList;

  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;

  int _quantity=0;
  int get quantity=>_quantity;


  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      //print("got Products====================================");
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      update();
      _isLoaded=true;
    }else{

    }


  }
  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity++;
    }
    else{
      _quantity--;
    }

  }

  //void update() {}

}