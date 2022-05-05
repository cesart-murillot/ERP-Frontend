
import 'package:erp_fronted/module/modules/module_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/product_api_provider.dart';

class Repository {
  final productApiProvider = ProductApiProvider();

  Future<Products?> fetchProductList() => productApiProvider.fetchProductList();
  Future<void> fetchLogin() => productApiProvider.login();
  Future<Modules?> fetchModuleList() => productApiProvider.fetchModuleList();
}