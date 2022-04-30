import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/src/models/meta_model.dart';
import 'package:erp_fronted/src/models/serializers.dart';

part 'product_model.g.dart';

abstract class ProductData implements Built<ProductData, ProductDataBuilder> {
  static Serializer<ProductData> get serializer => _$productDataSerializer;

  BuiltList<Product> get data;
  //LinkData get links;
  //MetaData get meta;

  ProductData._();
  factory ProductData([void Function(ProductDataBuilder) updates]) = _$ProductData;
}

abstract class Product implements Built<Product, ProductBuilder> {

  static Serializer<Product> get serializer => _$productSerializer;

  String get name;
  String get image_url;
  String get length;
  String get height;
  String get weight;
  int get units_box;
  String get brand_product;
  String get origin_product;

  Product._();
  factory Product([void Function(ProductBuilder) updates]) = _$Product;
}

ProductData? parseProductData(String jsonString){
  final parsed = jsonDecode(jsonString);
  ProductData? productData = standardSerializers.deserializeWith(ProductData.serializer, parsed);
  return productData;
}

