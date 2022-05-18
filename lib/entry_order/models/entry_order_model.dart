import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/entry_order/models/entry_order_product_model.dart';

part 'entry_order_model.g.dart';

abstract class EntryOrders implements Built<EntryOrders, EntryOrdersBuilder> {
  static Serializer<EntryOrders> get serializer => _$entryOrdersSerializer;

  @BuiltValueField(wireName: 'entry_orders')
  BuiltList<EntryOrder> get entryOrders;

  EntryOrders._();
  factory EntryOrders([void Function(EntryOrdersBuilder) updates]) = _$EntryOrders;
}

abstract class EntryOrder implements Built<EntryOrder, EntryOrderBuilder> {
  static Serializer<EntryOrder> get serializer => _$entryOrderSerializer;
  int? get id;

  @BuiltValueField(wireName: 'code_entry_order')
  String get codeEntryOrder;

  @BuiltValueField(wireName: 'created_at')
  String? get createdAt;

  @BuiltValueField(wireName: 'verified_entry_order')
  bool? get verifiedEntryOrder;

  @BuiltValueField(wireName: 'error_entry_order')
  bool? get errorEntryOrder;

  @BuiltValueField(wireName: 'entry_order_product')
  BuiltList<EntryOrderProduct>? get entryOrderProduct;

  EntryOrder._();
  factory EntryOrder([void Function(EntryOrderBuilder) updates]) = _$EntryOrder;
}

