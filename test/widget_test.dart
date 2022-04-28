// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:erp_fronted/src/modules.dart';
import 'package:erp_fronted/src/serializers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:erp_fronted/main.dart';
import 'package:http/http.dart' as http;

void main() {
  test("get json over network", () async {
    var url = Uri.http('127.0.0.1:8000', 'api/roles');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.isNotEmpty) {}
    }
  });

  test("parses module", () {
    const jsonString =
        """{"data":[{"id":1,"module":"Germany"},{"id":2,"module":"Svalbard & Jan Mayen Islands"},{"id":3,"module":"Bosnia and Herzegovina"},{"id":4,"module":"Monaco"},{"id":5,"module":"Syrian Arab Republic"},{"id":6,"module":"Lebanon"},{"id":7,"module":"Japan"},{"id":8,"module":"Slovenia"},{"id":9,"module":"Indonesia"},{"id":10,"module":"Ireland"}],"links":{"first":"http:\/\/127.0.0.1:8000\/api\/modules?page=1","last":"http:\/\/127.0.0.1:8000\/api\/modules?page=1","prev":null,"next":null},"meta":{"current_page":1,"from":1,"last_page":1,"links":[{"url":null,"label":"« Previous","active":false},{"url":"http:\/\/127.0.0.1:8000\/api\/modules?page=1","label":"1","active":true},{"url":null,"label":"Next »","active":false}],"path":"http:\/\/127.0.0.1:8000\/api\/modules","per_page":10,"to":10,"total":10}}""";
    Modules? modules = standardSerializers.deserializeWith(Modules.serializer, json.decode(jsonString));
    expect(modules?.data.first.module, "Germany");
  });
}

