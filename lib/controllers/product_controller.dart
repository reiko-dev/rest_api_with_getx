import 'package:get/state_manager.dart';
import 'package:rest_api_with_getx/models/product.dart';
import 'package:rest_api_with_getx/services/remote_services.dart';

class ProductController extends GetxController {
  var productsList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    print('fetching  products');
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      productsList.value = products;
    } catch (e) {
      print('ERROR when fetching data:');
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
