import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/product/models/product_model.dart';

part 'product_transfer_model.g.dart';

abstract class ProductTransfer implements Built<ProductTransfer, ProductTransferBuilder> {
  static Serializer<ProductTransfer> get serializer => _$productTransferSerializer;

  @BuiltValueField(wireName: 'product_id')
  int get productId;
  int get quantity;

  Product? get product;

  ProductTransfer._();
  factory ProductTransfer([void Function(ProductTransferBuilder) updates]) = _$ProductTransfer;
}