import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/module/models/module_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:http/http.dart' as http;

enum UnEncodePath { products, branches, warehouses, modules, users, employees, entries, entryorders}
const String scheme = 'http';
const String host = '127.0.0.1';
const int port = 8000;

class ProductApiProvider {
  Future<String> getDataModel(UnEncodePath unEncodePath, [String id = '', Map<String, dynamic> query = const {'':''}]) async {
    http.Response response;
    final Uri url;
    switch (unEncodePath) {
      case UnEncodePath.branches:
        url = Uri.http('127.0.0.1:8000', 'api/branches/' + id);
        break;
      case UnEncodePath.products:
        url = Uri(scheme: 'http', host: '127.0.0.1', port: 8000, path: 'api/products/'+id, queryParameters: query);
        //url = Uri.http('127.0.0.1:8000', 'api/products/', id);
        break;
      case UnEncodePath.entries:
        url = Uri(scheme: 'http', host: '127.0.0.1', port: 8000, path: 'api/entries/'+id, queryParameters: query);
        //url = Uri.http('127.0.0.1:8000', 'api/products/', id);
        break;
      case UnEncodePath.warehouses:
        url = Uri.http('127.0.0.1:8000', 'api/warehouses/');
        break;
      case UnEncodePath.modules:
        url = Uri.http('127.0.0.1:8000', 'api/modules/');
        break;
      case UnEncodePath.users:
        url = Uri.http('127.0.0.1:8000', 'api/users/' + id);
        break;
      case UnEncodePath.employees:
        url = Uri.http('127.0.0.1:8000', 'api/employees/' + id);
        break;
      case UnEncodePath.entryorders:
        url = Uri(scheme: scheme, host: host, port: port, path: 'api/entryorders/'+id, queryParameters: query);
        break;
    }
    print(url);
    response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    }
    throw Exception('No data');
  }

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

  Future<String> fetchUserData(int userId) async {
    http.Response response;
    var url = Uri.http('127.0.0.1:8000', 'api/users/' + userId.toString());
    response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Error');
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
          'Accept': 'application/json',
          'Authorization': 'Bearer'
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

  Future<String> loginAttempt(String user) async {
    var url = Uri.http('127.0.0.1:8000', 'api/login');
    http.Response response;
    response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        //'Authorization': 'Bearer ' + token,
      },
      body: user,
    );
    if (response.statusCode == 422) {
      print("no funciono");
    }
    return response.body;
  }
}
