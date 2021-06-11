import 'package:get/state_manager.dart';
import 'package:rest_api_with_getx/models/product.dart';

class ProductController extends GetxController {
  var productsList = <Product>[].obs;

  void addProduct(Product p) {
    productsList.add(p);
  }
}
