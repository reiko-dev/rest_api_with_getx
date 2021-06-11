import 'package:http/http.dart' as http;
import 'package:rest_api_with_getx/models/product.dart';

class RemoteServices {
  //Following the good practice this has to be static.
  static var client = http.Client();

  static final _url =
      'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productsFromJson(jsonString);
    } else {
      //show error messages.
      return [];
    }
  }
}
