
import 'package:http/http.dart' as http;
import 'package:erp_fronted/src/models/product_model.dart';

class ProductApiProvider {
  Future<ProductData?> fetchProductList() async {
    http.Response response;
    var url = Uri.http('127.0.0.1:8000', 'api/products');
    response = await http.get(url);
    if (response.statusCode == 200){
      return parseProductData(response.body);
    } else {
      throw Exception('Faild to load products');
    }
  }
}