
import 'package:erp_fronted/src/models/product_model.dart';
import 'package:erp_fronted/src/resources/product_api_provider.dart';

class Repository {
  final productApiProvider = ProductApiProvider();

  Future<ProductData?> fetchProductList() => productApiProvider.fetchProductList();
  Future<void> fetchLogin() => productApiProvider.login();
}