import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:http/http.dart' as http;

Uri preDefinedUri (String path, [Map<String, dynamic> query = const {}]) {
  final url = Uri(scheme: 'http', host: '127.0.0.1', port: 8000, path: path, queryParameters: query);
  return url;
}

Future<T> getObject<T>(final Uri url, Serializer serializer) async {
  final String objectString = await fetchDataFromApi(url);
  final T t = parseObject(objectString, serializer);
  return t;
}

Future<String> fetchDataFromApi(final Uri url) async {
  var response = await http.get(url);
  if (response.statusCode == 200) {
    return response.body;
  }
  throw Exception('An error has occurred: ' + response.statusCode.toString());
}
