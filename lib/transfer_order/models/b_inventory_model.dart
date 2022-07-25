import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'b_inventory_model.g.dart';

abstract class BInventories implements Built<BInventories, BInventoriesBuilder> {
  static Serializer<BInventories> get serializer => _$bInventoriesSerializer;

  @BuiltValueField(wireName: 'b_inventories')
  BuiltList<BInventory> get bInventories;

  BInventories._();
  factory BInventories([void Function(BInventoriesBuilder) updates]) = _$BInventories;
}

abstract class BInventory implements Built<BInventory, BInventoryBuilder> {
  static Serializer<BInventory> get serializer => _$bInventorySerializer;

  int? get id;
  int get quantity;

  @BuiltValueField(wireName: 'remain_units')
  int? get remainUnits;

  @BuiltValueField(wireName: 'product_id')
  int get productId;

  @BuiltValueField(wireName: 'section_id')
  int get sectionId;

  @BuiltValueField(wireName: 'user_id')
  int? get userId;

  @BuiltValueField(wireName: 'product_transfer_id')
  int get productTransferId;

  BInventory._();
  factory BInventory([void Function(BInventoryBuilder) updates]) = _$BInventory;
}