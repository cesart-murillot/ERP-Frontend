import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/product/models/product_model.dart';

part 'entry_order_product_model.g.dart';
abstract class EntryOrderProduct implements Built<EntryOrderProduct, EntryOrderProductBuilder> {
  static Serializer<EntryOrderProduct> get serializer => _$entryOrderProductSerializer;

  int? get id;

  @BuiltValueField(wireName: 'entry_order_id')
  int? get entryOrderId;

  @BuiltValueField(wireName: 'product_id')
  int get productId;

  int get quantity;

  Product? get product;

  EntryOrderProduct._();
  factory EntryOrderProduct([void Function(EntryOrderProductBuilder) updates]) = _$EntryOrderProduct;
}