/*
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'meta_link.dart';

part 'products.g.dart';

abstract class Products implements Built<Products, ProductsBuilder> {
  static Serializer<Products> get serializer => _$productsSerializer;

  BuiltList<Product> get data;
  Links get links;
  Meta get meta;

  Products._();
  factory Products([void Function(ProductsBuilder) updates]) = _$Products;
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
}*/
