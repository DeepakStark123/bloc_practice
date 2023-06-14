import 'package:http/http.dart' as http;
import 'package:test_app/products/models/product_model.dart';

class ProductRepo {
  Future<List<ProductModel>> getProducts() async {
    var res = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (res.statusCode == 200) {
      return productModelFromJson(res.body.toString());
    } else {
      throw Exception("Failed to load products");
    }
  }
}
