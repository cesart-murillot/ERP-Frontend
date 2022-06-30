import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/entry_order/models/entry_order_model.dart';
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

  bool? get verified;

  bool? get error;

  Product? get product;

  @BuiltValueField(wireName: 'entry_order')
  EntryOrder? get entryOrder;

  EntryOrderProduct._();
  factory EntryOrderProduct([void Function(EntryOrderProductBuilder) updates]) = _$EntryOrderProduct;
}