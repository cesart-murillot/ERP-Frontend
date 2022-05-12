import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:erp_fronted/src/models/meta_model.dart';
import 'package:erp_fronted/src/models/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';


part 'product_model.g.dart';

abstract class Products implements Built<Products, ProductsBuilder> {
  static Serializer<Products> get serializer => _$productsSerializer;
  
  BuiltList<Product> get products;
  LinkData? get links;
  MetaData? get meta;
  
  Products._();
  factory Products([void Function(ProductsBuilder) updates]) = _$Products;
}

abstract class Product implements Built<Product, ProductBuilder> {
  static Serializer<Product> get serializer => _$productSerializer;

  int? get id;

  @BuiltValueField(wireName: 'name_product')
  String get nameProduct;

  @BuiltValueField(wireName: 'image_product')
  String? get imageProduct;

  @BuiltValueField(wireName: 'length_product')
  String? get lengthProduct;

  @BuiltValueField(wireName: 'height_product')
  String? get heightProduct;

  @BuiltValueField(wireName: 'weight_product')
  String? get weightProduct;

  @BuiltValueField(wireName: 'units_box_product')
  int? get unitsBoxProduct;

  @BuiltValueField(wireName: 'brand_product')
  String? get brandProduct;

  @BuiltValueField(wireName: 'origin_product')
  String get originProduct;

  Product._();
  factory Product([void Function(ProductBuilder) updates]) = _$Product;
}

Products? parseProducts(String jsonString) {
  final parsed = jsonDecode(jsonString);
  Products? products = standardSerializers.deserializeWith(Products.serializer, parsed);
  return products;
}

Product? parseProduct(String productString) {
  final parsedProduct = jsonDecode(productString);
  Product? product = standardSerializers.deserializeWith(Product.serializer, parsedProduct);
  return product;
}