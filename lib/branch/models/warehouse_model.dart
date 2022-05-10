import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:erp_fronted/src/models/meta_model.dart';
import 'package:erp_fronted/src/models/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'warehouse_model.g.dart';

abstract class Warehouses implements Built<Warehouses, WarehousesBuilder> {
  static Serializer<Warehouses> get serializer => _$warehousesSerializer;

  BuiltList get warehouses;

  Warehouses._();
  factory Warehouses([void Function(WarehousesBuilder) updates]) = _$Warehouses;
}

abstract class Warehouse implements Built<Warehouse, WarehouseBuilder> {
  static Serializer<Warehouse> get serializer => _$warehouseSerializer;

  int? get id;

  @BuiltValueField(wireName: 'name_warehouse')
  String get nameWarehouse;

  @BuiltValueField(wireName: 'branch_id')
  int? get branchId;

  Warehouse._();
  factory Warehouse([void Function(WarehouseBuilder) updates]) = _$Warehouse;
}