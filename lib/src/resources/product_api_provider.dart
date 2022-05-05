import 'dart:convert';

import 'package:erp_fronted/module/modules/module_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:erp_fronted/src/models/product_model.dart';
import 'package:erp_fronted/src/models/serializers.dart';

class ProductApiProvider {
/*  Future<ProductData?> fetchProductList() async {
    http.Response response;
    var url = Uri.http('127.0.0.1:8000', 'api/products');
    response = await http.get(url);
    if (response.statusCode == 200) {
      return parseProductData(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }*/
  Future<Products?> fetchProductList() async {
    http.Response response;
    var url = Uri.http('127.0.0.1:8000', 'api/products');
    response = await http.get(url);
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Modules?> fetchModuleList() async {
    http.Response response;
    var url = Uri.http('127.0.0.1:8000', 'api/models');
    response = await http.get(url);
    if (response.statusCode == 200) {
      return parseModules(response.body);
    } else {
      throw Exception('Faild to load models');
    }
  }

  Future<http.Response> postProductList(String product) async {
    var url = Uri.http('127.0.0.1:8000', 'api/products');
    http.Response response;
    response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: product);

    if (response.statusCode == 422) {
      print("no funciono");
    }
    print(response.statusCode);
    return response;
    //Object? jsonSerial = standardSerializers.serializeWith(Product.serializer, jsonEncode(product);
    /*response = http.post(url, headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8'},body: Seriali);*/
  }

  Future<void> login() async {
    print('Attemting login');
    await Future.delayed(const Duration(seconds: 3));
    print('Logged in');
  }
}
