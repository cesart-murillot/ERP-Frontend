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

  @BuiltValueField(wireName: 'model_product')
  String get modelProduct;

  @BuiltValueField(wireName: 'description_product')
  String? get descriptionProduct;

  @BuiltValueField(wireName: 'url_image_product')
  String? get urlImageProduct;

  @BuiltValueField(wireName: 'format_product')
  String? get formatProduct;

  @BuiltValueField(wireName: 'code_product')
  String? get codeProduct;

  @BuiltValueField(wireName: 'family_product')
  String? get familyProduct;

  @BuiltValueField(wireName: 'finish_product')
  String? get finishProduct;

  @BuiltValueField(wireName: 'brand_product')
  String? get brandProduct;

  @BuiltValueField(wireName: 'origin_product')
  String? get originProduct;

  @BuiltValueField(wireName: 'unit_measure_product')
  String? get unitMeasureProduct;

  @BuiltValueField(wireName: 'units_box_product')
  int? get unitsBoxProduct;

  @BuiltValueField(wireName: 'area_box_product')
  double? get areaBoxProduct;


  @BuiltValueField(wireName: 'boxes_pallet_product')
  int? get boxesPalletProduct;

  @BuiltValueField(wireName: 'area_pallet_product')
  double? get areaPalletProduct;

  @BuiltValueField(wireName: 'weight_box_product')
  double? get weightBoxProduct;

  @BuiltValueField(wireName: 'weight_pallet_product')
  double? get weightPalletProduct;

  @BuiltValueField(wireName: 'created_at')
  String? get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String? get updatedAt;

  @BuiltValueField(wireName: 'remain_units')
  int? get remainUnits;

  @BuiltValueField(wireName: 'reorder_point')
  int? get reorderPoint;

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