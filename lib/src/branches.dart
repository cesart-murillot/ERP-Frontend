/*
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/src/meta_link.dart';

part 'branches.g.dart';

abstract class Branches implements Built<Branches, BranchesBuilder> {
  static Serializer<Branches> get serializer => _$branchesSerializer;

  BuiltList<Data> get data;
  Links get links;
  Meta get meta;

  Branches._();
  factory Branches([void Function(BranchesBuilder) updates]) = _$Branches;
}

abstract class Data implements Built<Data, DataBuilder> {
  static Serializer<Data> get serializer => _$dataSerializer;

  String get name;
  String get address;
  BuiltList<Warehouses>? get warehouses;

  Data._();
  factory Data([void Function(DataBuilder) updates]) = _$Data;
}

abstract class Warehouses implements Built<Warehouses, WarehousesBuilder> {
  static Serializer<Warehouses> get serializer => _$warehousesSerializer;

  String get name;
  BuiltList<Sections>? get sections;

  Warehouses._();
  factory Warehouses([void Function(WarehousesBuilder) updates]) = _$Warehouses;
}

abstract class Sections implements Built<Sections, SectionsBuilder> {
  static Serializer<Sections> get serializer => _$sectionsSerializer;
  int get id;
  String get name_section;
  int get warehouse_id;
  String get created_at;
  String get updated_at;
  String? get deleted_at;
  Sections._();
  factory Sections([void Function(SectionsBuilder) updates]) = _$Sections;
}
*/
