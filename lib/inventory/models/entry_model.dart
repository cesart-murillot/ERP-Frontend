import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/product/models/product_model.dart';

part 'entry_model.g.dart';

abstract class Entries implements Built<Entries, EntriesBuilder> {
  static Serializer<Entries> get serializer => _$entriesSerializer;

  BuiltList<Entry> get entries;

  Entries._();
  factory Entries([void Function(EntriesBuilder) updates]) = _$Entries;
}

abstract class Entry implements Built<Entry, EntryBuilder> {
  static Serializer<Entry> get serializer => _$entrySerializer;

  int? get id;

  @BuiltValueField(wireName: 'quantity_entry')
  int get quantityEntry;

  @BuiltValueField(wireName: 'supplier_entry')
  String? get supplierEntry;

  @BuiltValueField(wireName: 'note_entry')
  String? get noteEntry;

  @BuiltValueField(wireName: 'verified_entry')
  bool get verifiedEntry;

  @BuiltValueField(wireName: 'error_entry')
  bool get errorEntry;

  @BuiltValueField(wireName: 'product_id')
  int get productId;

  @BuiltValueField(wireName: 'created_at')
  String? get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String? get updatedAt;

  @BuiltValueField(wireName: 'deleted_at')
  String? get deletedAt;

  Product? get product;

  Entry._();
  factory Entry([void Function(EntryBuilder) updates]) = _$Entry;
}