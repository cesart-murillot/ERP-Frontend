// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:erp_fronted/src/branches.dart';
import 'package:erp_fronted/src/meta_link.dart';
import 'package:erp_fronted/src/modules.dart';
import 'package:erp_fronted/src/products.dart';
import 'package:erp_fronted/src/serializers.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;

void main() {

  test("get json over network", () async {
    var url = Uri.http('127.0.0.1:8000', 'api/modules');
    final response = await http.get(url);

    Modules? modules = standardSerializers.deserializeWith(Modules.serializer, json.decode(response.body));

    expect(modules?.data.first.module, "asdf");
  });

  test("get Products over network", () async {
    var url = Uri.http('127.0.0.1:8000', 'api/products');
    final response = await http.get(url);

    Products? products = standardSerializers.deserializeWith(Products.serializer, json.decode(response.body));

    expect(products?.data.first.name, "Germany");
  });


  test("parse product", (){
    const jsonString = """
    {"name":"Product 1","image_url":"an image","length":"20","height":"20","weight":"10","units_box":6,"brand_product":"A brand","origin_product":"A country"}
    """;

    Product? product = standardSerializers.deserializeWith(Product.serializer, json.decode(jsonString));
    expect(product?.name, "Product 1");
  });

  test("parses module", () {
    const jsonString =
        """{"data":[{"id":1,"module":"Germany"},{"id":2,"module":"Svalbard & Jan Mayen Islands"},{"id":3,"module":"Bosnia and Herzegovina"},{"id":4,"module":"Monaco"},{"id":5,"module":"Syrian Arab Republic"},{"id":6,"module":"Lebanon"},{"id":7,"module":"Japan"},{"id":8,"module":"Slovenia"},{"id":9,"module":"Indonesia"},{"id":10,"module":"Ireland"}],"links":{"first":"http:\/\/127.0.0.1:8000\/api\/modules?page=1","last":"http:\/\/127.0.0.1:8000\/api\/modules?page=1","prev":null,"next":null},"meta":{"current_page":1,"from":1,"last_page":1,"links":[{"url":null,"label":"« Previous","active":false},{"url":"http:\/\/127.0.0.1:8000\/api\/modules?page=1","label":"1","active":true},{"url":null,"label":"Next »","active":false}],"path":"http:\/\/127.0.0.1:8000\/api\/modules","per_page":10,"to":10,"total":10}}""";
    Modules? modules = standardSerializers.deserializeWith(Modules.serializer, json.decode(jsonString));
    expect(modules?.data.first.module, "Germany");
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
  });

}


