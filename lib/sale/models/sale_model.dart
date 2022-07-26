import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';

part 'sale_model.g.dart';

abstract class Sales implements Built<Sales, SalesBuilder> {
  static Serializer<Sales> get serializer => _$salesSerializer;

  BuiltList<Sale> get sales;

  Sales._();
  factory Sales([void Function(SalesBuilder) updates]) = _$Sales;
}

abstract class Sale implements Built<Sale, SaleBuilder> {
  static Serializer<Sale> get serializer => _$saleSerializer;

  int? get id;

  @BuiltValueField(wireName: 'name_sale')
  String get nameSale;

  @BuiltValueField(wireName: 'nit_sale')
  String get nitSale;

  @BuiltValueField(wireName: 'total_sale')
  double get totalSale;

  @BuiltValueField(wireName: 'date_sale')
  String? get dateSale;

  @BuiltValueField(wireName: 'user_id')
  int? get userId;

  @BuiltValueField(wireName: 'branch_id')
  int? get branchId;

  @BuiltValueField(wireName: 'quotation_id')
  int? get quotationId;

  User? get user;

  Branch? get branch;

  @BuiltValueField(wireName: 'product_sales')
  BuiltList<ProductSale>? get productSales;

  Sale._();
  factory Sale([void Function(SaleBuilder) updates]) = _$Sale;
}

abstract class ProductSale implements Built<ProductSale, ProductSaleBuilder> {
  static Serializer<ProductSale> get serializer => _$productSaleSerializer;

  int? get id;

  @BuiltValueField(wireName: 'unit_price')
  double get unitPrice;

  int get quantity;

  @BuiltValueField(wireName: 'total_price')
  double get totalPrice;

  @BuiltValueField(wireName: 'sale_id')
  int? get saleId;

  @BuiltValueField(wireName: 'product_id')
  int get productId;

  Product? get product;

  ProductSale._();
  factory ProductSale([void Function(ProductSaleBuilder) updates]) = _$ProductSale;
}