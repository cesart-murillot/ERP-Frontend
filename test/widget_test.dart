// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/module/models/module_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/src/models/meta_model.dart';
import 'package:erp_fronted/src/models/serializers.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:erp_fronted/src/resources/api_provider.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter_test/flutter_test.dart';


//enum UnEncodePath {products, branches, warehouses}

void main() {
/*  test("get json over network", () async {
    var url = Uri.http('127.0.0.1:8000', 'api/models');
    final response = await http.get(url);

    Modules? models = standardSerializers.deserializeWith(Modules.serializer, json.decode(response.body));

    expect(models?.data.first.module, "asdf");
  });*/

/*  test("get Products over network dfsa", () {
    const jsonString = """{"data":[{"name":"Product 1","image_url":"an image","length":"20","height":"20","weight":"10","units_box":6,"brand_product":"A brand","origin_product":"A country"}]}""";

    ProductData? products = standardSerializers.deserializeWith(ProductData.serializer, json.decode(jsonString));

    expect(products?.data.first.name, "Product 1");
  });*/

/*  test("get Products over network", () async {
    var url = Uri.http('127.0.0.1:8000', 'api/products');
    final response = await http.get(url);

    ProductData? products = standardSerializers.deserializeWith(ProductData.serializer, json.decode(response.body));

    expect(products?.data.first.name, "Germany");
  });*/

/*  test("parse product", (){
    const jsonString = """
    {"name":"Product 1","image_url":"an image","length":"20","height":"20","weight":"10","units_box":6,"brand_product":"A brand","origin_product":"A country"}
    """;

    Product? product = standardSerializers.deserializeWith(Product.serializer, json.decode(jsonString));
    expect(product?.name, "Product 1");
  });*/

  test('generic', () {
    String? objectToString<T>(final T object, Serializer serializer) {
      final Object? objectSerialized =
          standardSerializers.serializeWith(serializer, object);
      final String? objectString = jsonEncode(objectSerialized);

      return objectString;
    }

    T parseObject<T>(final String objectString, Serializer serializer) {
      final parsedObject = jsonDecode(objectString);
      T object = standardSerializers.deserializeWith(serializer, parsedObject);
      return object;
    }

    var branches = Branches(
      (p0) {
        for (int i = 0; i < 3; i++) {
          var branch = Branch(
            (p0) => p0.nameBranch = 'hola' + i.toString(),
          );
          p0.branches.add(branch);
        }
      },
    );

    var user = User((b) => b
      ..email = 'cesar@gmail.com'
      ..password = '123');

    String? a = objectToString<User>(user, User.serializer);
    print(a);

    String? b = objectToString<Branches>(branches, Branches.serializer);
    print(b);

    print(parseObject(a!, User.serializer));
    print(parseObject(b!, Branches.serializer));
  });

  test('instantiate user', () {
    var user = User((b) => b
      ..email = 'cesar@gmail.com'
      ..password = '123');
    print(user);

    Object? jsonSerial =
        standardSerializers.serializeWith(User.serializer, user);
    print(jsonSerial);

    print(jsonEncode(jsonSerial));
  });

  test('instantiate branches', () {
    var branches = Branches(
      (p0) {
        for (int i = 0; i < 3; i++) {
          var branch = Branch(
            (p0) => p0.nameBranch = 'hola' + i.toString(),
          );
          p0.branches.add(branch);
        }
      },
    );

    print(branches.branches[0].nameBranch);
    print(branches.branches[1].nameBranch);
    print(branches.branches[2].nameBranch);
  });

  test('get user by id', () async {
    final _repository = Repository();
    try {
      String response = await _repository.fetchUser(1);
      print(response);
      User? user = parseUser(response);

      print(user.toString());
    } catch (e) {
      print('error');
    }
  });
  test('Login attempt', () async {
    const user = '';
    final _repository = Repository();

    try {
      String response = await _repository.attemptLogin(user);
      print(response);
    } catch (e) {
      print('error');
    }
  });

  test("parse link", () {
    const jsonString = """
    {"first":"http://127.0.0.1:8000/api/models?page=1","last":"http://127.0.0.1:8000/api/models?page=1","prev":null,"next":null}
    """;

    LinkData? product = standardSerializers.deserializeWith(
        LinkData.serializer, json.decode(jsonString));
    expect(product?.first, "http://127.0.0.1:8000/api/models?page=1");
  });

  test("parse meta", () {
    const jsonString = """
    {"url":null,"label":"&laquo; Previous","active":false}
    """;

    NavigationData? product = standardSerializers.deserializeWith(
        NavigationData.serializer, json.decode(jsonString));
    expect(product?.url, null);
  });

  test("parse complete meta", () {
    const jsonString = """
    {"current_page":1,"from":1,"last_page":2,"links":[{"url":null,"label":"&laquo; Previous","active":false},{"url":"http://127.0.0.1:8000/api/products?page=1","label":"1","active":true},{"url":"http://127.0.0.1:8000/api/products?page=2","label":"2","active":false},{"url":"http://127.0.0.1:8000/api/products?page=2","label":"Next &raquo;","active":false}],"path":"http://127.0.0.1:8000/api/products","per_page":5,"to":5,"total":10}
    """;

    MetaData? product = standardSerializers.deserializeWith(
        MetaData.serializer, json.decode(jsonString));
    expect(product?.links.first.url, null);
  });

  test('new URI', () async {
    final repository = Repository();

    const String authority = '127.0.0.1:8000/api/';

    //print(authority + UnEncodePath.branches.name);
    String branchesString = await repository.fetchData(UnEncodePath.branches);
    print(branchesString);
    print(parseObject(branchesString, Branch.serializer));
  });

/*  test('Encode to json', () {
    const jsonString = """
    {"name":"Product 1","image_url":"an image","length":"20","height":"20","weight":"10","units_box":6,"brand_product":"A brand","origin_product":"A country"}
    """;

    Product? product = standardSerializers.deserializeWith(Product.serializer, json.decode(jsonString));

    */ /*List<Product> list = [];
    //list.add(product!);

    ListBuilder<Product?> listBuilder = list as ListBuilder<Product?>;
    listBuilder.add(product);*/ /*

    Object? jsonSerial = standardSerializers.serializeWith(Product.serializer, product);
    if (kDebugMode) {
      print(jsonEncode(jsonSerial));
      //print(product.first.name);
    }
    if (kDebugMode) {
      print(jsonSerial.toString());
    }
  });*/

/*  test('posting product', () async {
    const jsonString = """
    {"products":[{"name":"Product 1","image_url":"an image","length":"20","height":"20","weight":"10","units_box":6,"brand_product":"A brand","origin_product":"A country"}]}
    """;
    ProductData? product = standardSerializers.deserializeWith(ProductData.serializer, json.decode(jsonString));
    Object? jsonSerial = standardSerializers.serializeWith(ProductData.serializer, product);
    var url = Uri.http('127.0.0.1:8000', 'api/products');
    http.Response response;
    response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(jsonSerial));
    print(jsonEncode(jsonSerial));
    print(response.body);
  });*/

  test('get models', () async {
    final _repository = Repository();
    Modules? modules = await _repository.fetchModuleList();

    print(modules?.modules.first);
  });
/*
  test("parses module", () {
    const jsonString =
        """{"data":[{"id":1,"module":"Germany"},{"id":2,"module":"Svalbard & Jan Mayen Islands"},{"id":3,"module":"Bosnia and Herzegovina"},{"id":4,"module":"Monaco"},{"id":5,"module":"Syrian Arab Republic"},{"id":6,"module":"Lebanon"},{"id":7,"module":"Japan"},{"id":8,"module":"Slovenia"},{"id":9,"module":"Indonesia"},{"id":10,"module":"Ireland"}],"links":{"first":"http:\/\/127.0.0.1:8000\/api\/models?page=1","last":"http:\/\/127.0.0.1:8000\/api\/models?page=1","prev":null,"next":null},"meta":{"current_page":1,"from":1,"last_page":1,"links":[{"url":null,"label":"« Previous","active":false},{"url":"http:\/\/127.0.0.1:8000\/api\/models?page=1","label":"1","active":true},{"url":null,"label":"Next »","active":false}],"path":"http:\/\/127.0.0.1:8000\/api\/models","per_page":10,"to":10,"total":10}}""";
    Modules? models = standardSerializers.deserializeWith(Modules.serializer, json.decode(jsonString));
    expect(models?.data.first.module, "Germany");
  });

  test("parses branches", () {

    const jsonString =
      """{"data":[{"name":"Parisian PLC","address":"35730 Predovic Spring Suite 202 Port Lilly, MT 26362","warehouses":[]},{"name":"Blick-O'Kon","address":"2555 Randall Mountain Suite 392 Port Saulfort, PA 85689","warehouses":[]},{"name":"Stokes, Bailey and Mante","address":"156 Boyle Road Apt. 416 East Maudberg, TX 17156","warehouses":[]},{"name":"Goodwin, Purdy and Lubowitz","address":"75680 Quigley Walks Hettingerstad, MN 99506","warehouses":[{"name":"Predovic Corners","sections":[{"id":1,"name_section":"y","warehouse_id":1,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":2,"name_section":"a","warehouse_id":1,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":3,"name_section":"i","warehouse_id":1,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":61,"name_section":"Section A","warehouse_id":1,"created_at":"2022-04-27T00:05:33.000000Z","updated_at":"2022-04-27T00:05:33.000000Z","deleted_at":null},{"id":62,"name_section":"Section B","warehouse_id":1,"created_at":"2022-04-27T00:05:33.000000Z","updated_at":"2022-04-27T00:05:33.000000Z","deleted_at":null},{"id":63,"name_section":"Section C","warehouse_id":1,"created_at":"2022-04-27T00:05:33.000000Z","updated_at":"2022-04-27T00:05:33.000000Z","deleted_at":null}]},{"name":"Arianna Villages","sections":[{"id":4,"name_section":"j","warehouse_id":2,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":5,"name_section":"u","warehouse_id":2,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":6,"name_section":"v","warehouse_id":2,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":64,"name_section":"Section A","warehouse_id":2,"created_at":"2022-04-27T00:10:49.000000Z","updated_at":"2022-04-27T00:10:49.000000Z","deleted_at":null},{"id":65,"name_section":"Section B","warehouse_id":2,"created_at":"2022-04-27T00:10:49.000000Z","updated_at":"2022-04-27T00:10:49.000000Z","deleted_at":null},{"id":66,"name_section":"Section C","warehouse_id":2,"created_at":"2022-04-27T00:10:49.000000Z","updated_at":"2022-04-27T00:10:49.000000Z","deleted_at":null}]},{"name":"Hessel Radial","sections":[{"id":7,"name_section":"h","warehouse_id":3,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":8,"name_section":"s","warehouse_id":3,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":9,"name_section":"l","warehouse_id":3,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":67,"name_section":"Section A","warehouse_id":3,"created_at":"2022-04-27T00:10:49.000000Z","updated_at":"2022-04-27T00:10:49.000000Z","deleted_at":null},{"id":68,"name_section":"Section B","warehouse_id":3,"created_at":"2022-04-27T00:10:49.000000Z","updated_at":"2022-04-27T00:10:49.000000Z","deleted_at":null},{"id":69,"name_section":"Section C","warehouse_id":3,"created_at":"2022-04-27T00:10:49.000000Z","updated_at":"2022-04-27T00:10:49.000000Z","deleted_at":null}]},{"name":"Miller Glens","sections":[{"id":10,"name_section":"p","warehouse_id":4,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":11,"name_section":"t","warehouse_id":4,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":12,"name_section":"g","warehouse_id":4,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":70,"name_section":"Section A","warehouse_id":4,"created_at":"2022-04-27T00:10:49.000000Z","updated_at":"2022-04-27T00:10:49.000000Z","deleted_at":null},{"id":71,"name_section":"Section B","warehouse_id":4,"created_at":"2022-04-27T00:10:49.000000Z","updated_at":"2022-04-27T00:10:49.000000Z","deleted_at":null},{"id":72,"name_section":"Section C","warehouse_id":4,"created_at":"2022-04-27T00:10:49.000000Z","updated_at":"2022-04-27T00:10:49.000000Z","deleted_at":null}]}]},{"name":"Mraz, Moen and Rempel","address":"8879 Welch Islands Port Hal, MO 84779-8661","warehouses":[{"name":"Jakubowski Island","sections":[{"id":13,"name_section":"e","warehouse_id":5,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":14,"name_section":"p","warehouse_id":5,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":15,"name_section":"h","warehouse_id":5,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":73,"name_section":"Section A","warehouse_id":5,"created_at":"2022-04-27T00:10:49.000000Z","updated_at":"2022-04-27T00:10:49.000000Z","deleted_at":null},{"id":74,"name_section":"Section B","warehouse_id":5,"created_at":"2022-04-27T00:10:49.000000Z","updated_at":"2022-04-27T00:10:49.000000Z","deleted_at":null},{"id":75,"name_section":"Section C","warehouse_id":5,"created_at":"2022-04-27T00:10:49.000000Z","updated_at":"2022-04-27T00:10:49.000000Z","deleted_at":null}]},{"name":"Gleichner Cape","sections":[{"id":16,"name_section":"t","warehouse_id":6,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":17,"name_section":"h","warehouse_id":6,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":18,"name_section":"r","warehouse_id":6,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null}]},{"name":"Blanda Forks","sections":[{"id":19,"name_section":"p","warehouse_id":7,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":20,"name_section":"k","warehouse_id":7,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":21,"name_section":"e","warehouse_id":7,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null}]},{"name":"Daryl Island","sections":[{"id":22,"name_section":"g","warehouse_id":8,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":23,"name_section":"u","warehouse_id":8,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null},{"id":24,"name_section":"s","warehouse_id":8,"created_at":"2022-04-26T23:49:39.000000Z","updated_at":"2022-04-26T23:49:39.000000Z","deleted_at":null}]}]}],"links":{"first":"http:\/\/127.0.0.1:8000\/api\/branches?page=1","last":"http:\/\/127.0.0.1:8000\/api\/branches?page=2","prev":null,"next":"http:\/\/127.0.0.1:8000\/api\/branches?page=2"},"meta":{"current_page":1,"from":1,"last_page":2,"links":[{"url":null,"label":"« Previous","active":false},{"url":"http:\/\/127.0.0.1:8000\/api\/branches?page=1","label":"1","active":true},{"url":"http:\/\/127.0.0.1:8000\/api\/branches?page=2","label":"2","active":false},{"url":"http:\/\/127.0.0.1:8000\/api\/branches?page=2","label":"Next »","active":false}],"path":"http:\/\/127.0.0.1:8000\/api\/branches","per_page":5,"to":5,"total":8}}""";
    Branches? branches = standardSerializers.deserializeWith(Branches.serializer, json.decode(jsonString));
    expect(branches?.data.first.name, "Parisian PLC");
  });

  test("parses products", () {

    const jsonString =
    """{"data":[{"name":"Product 2","image_url":"an image","length":"20","height":"20","weight":"10","units_box":6,"brand_product":"A brand","origin_product":"A country"}]}""";
    Products? products = standardSerializers.deserializeWith(Products.serializer, json.decode(jsonString));

    expect(products?.data.first.name, "Product 2");
  });*/

  test('search query', () async {
    final _repository = Repository();
    final String productSuggestionString = await _repository.fetchData(UnEncodePath.products, 'fire');
/*    http.Response response;
    Uri url = Uri.http('127.0.0.1:8000', 'api/products/', {'search': 'fire'});
    response = await http.get(url);*/
    print(productSuggestionString);
  });

  test('uri url', () {
    Uri url = Uri(port: 8000, host: '127.0.0.1', path: 'api/products/', queryParameters: {'':''}, scheme: 'http');
    print(url);
  });
  test('product', () async {
    final _repository = Repository();
    final String productString = await _repository.fetchData(UnEncodePath.products);
    final Products products = parseObject(productString, Products.serializer);

    print(products);
  });
}
