
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/entry_order/models/entry_order_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';

part 'product_entry_model.g.dart';

abstract class ProductEntries implements Built<ProductEntries, ProductEntriesBuilder> {
  static Serializer<ProductEntries> get serializer => _$productEntriesSerializer;

  @BuiltValueField(wireName: 'product_entries')
  BuiltList<ProductEntry> get productEntries;

  ProductEntries._();
  factory ProductEntries([void Function(ProductEntriesBuilder) updates]) = _$ProductEntries;
}

abstract class ProductEntry implements Built<ProductEntry, ProductEntryBuilder> {
  static Serializer<ProductEntry> get serializer => _$productEntrySerializer;

  int? get id;

  @BuiltValueField(wireName: 'entry_order_id')
  int get entryOrderId;

  @BuiltValueField(wireName: 'product_id')
  int get productId;

  int get quantity;

  bool? get verified;
  bool? get error;

  @BuiltValueField(wireName: 'created_at')
  String get createdAt;

  Product get product;

  @BuiltValueField(wireName: 'entry_order')
  EntryOrder get entryOrder;

  ProductEntry._();
  factory ProductEntry([void Function(ProductEntryBuilder) updates]) = _$ProductEntry;
}