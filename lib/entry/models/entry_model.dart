import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/branch/models/section_model.dart';
import 'package:erp_fronted/entry_order/models/entry_order_product_model.dart';

part 'entry_model.g.dart';

abstract class Entries implements Built<Entries, EntriesBuilder> {
  static Serializer<Entries> get serializer => _$entriesSerializer;

  BuiltList<Entry> get entries;

  Entries._();
  factory Entries([void Function(EntriesBuilder) updates]) = _$Entries;
}

abstract class Entry implements Built<Entry, EntryBuilder> {
  static Serializer<Entry> get serializer => _$entrySerializer;

  @BuiltValueField(wireName: 'quantity_entry')
  int get quantityEntry;

  @BuiltValueField(wireName: 'remain_entry')
  int? get remainEntry;

  @BuiltValueField(wireName: 'product_id')
  int get productId;

  @BuiltValueField(wireName: 'section_id')
  int get sectionId;

  @BuiltValueField(wireName: 'created_at')
  String? get createdAt;

  @BuiltValueField(wireName: 'entry_order_products_id')
  int get entryOrderProductId;

  Section? get section;

  @BuiltValueField(wireName: 'entry_order_products')
  EntryOrderProduct? get entryOrderProduct;


  Entry._();
  factory Entry([void Function(EntryBuilder) updates]) = _$Entry;
}