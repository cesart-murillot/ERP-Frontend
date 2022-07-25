import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';

part 'quotation_model.g.dart';

abstract class Quotations implements Built<Quotations, QuotationsBuilder> {
  static Serializer<Quotations> get serializer => _$quotationsSerializer;

  BuiltList<Quotation> get quotations;

  Quotations._();
  factory Quotations([void Function(QuotationsBuilder) updates]) = _$Quotations;
}

abstract class Quotation implements Built<Quotation, QuotationBuilder> {
  static Serializer<Quotation> get serializer => _$quotationSerializer;

  int? get id;

  @BuiltValueField(wireName: 'name_quotation')
  String get nameQuotation;

  @BuiltValueField(wireName: 'price_quotation')
  double get priceQuotation;

  @BuiltValueField(wireName: 'date_quotation')
  String? get dateQuotation;

  @BuiltValueField(wireName: 'expiration_date')
  String? get expirationDate;

  @BuiltValueField(wireName: 'user_id')
  int? get userId;

  @BuiltValueField(wireName: 'branch_id')
  int? get branchId;

  @BuiltValueField(wireName: 'product_quotations')
  BuiltList<ProductQuotation> get productQuotations;

  User? get user;

  Branch? get branch;
  Quotation._();
  factory Quotation([void Function(QuotationBuilder) updates]) = _$Quotation;
}

abstract class ProductQuotation implements Built<ProductQuotation, ProductQuotationBuilder> {
  static Serializer<ProductQuotation> get serializer => _$productQuotationSerializer;

  int? get id;

  int get quantity;

  @BuiltValueField(wireName: 'unit_price')
  double get unitPrice;

  @BuiltValueField(wireName: 'total_price')
  double get totalPrice;

  @BuiltValueField(wireName: 'quotation_id')
  int? get quotationId;

  @BuiltValueField(wireName: 'product_id')
  int get productId;

  Product? get product;

  ProductQuotation._();
  factory ProductQuotation([void Function(ProductQuotationBuilder) updates]) = _$ProductQuotation;
}