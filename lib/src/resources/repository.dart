import 'package:erp_fronted/module/models/module_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/api_provider.dart';

class Repository {
  final productApiProvider = ApiProvider();

  Future<String> fetchData(UnEncodePath unEncodePath, [String? id, Map<String, dynamic> query = const {}]) =>
      productApiProvider.getDataModel(unEncodePath, id ?? '', query);

  Future<Products?> fetchProductList() => productApiProvider.fetchProductList();
  Future<void> fetchLogin() => productApiProvider.login();
  Future<Modules?> fetchModuleList() => productApiProvider.fetchModuleList();
  Future<String> attemptLogin(String user) =>
      productApiProvider.loginAttempt(user);
  Future<String> fetchUser(int userId) =>
      productApiProvider.fetchUserData(userId);
}
