/*
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'meta_link.dart';

part 'modules.g.dart';

abstract class Modules implements Built<Modules, ModulesBuilder> {
  static Serializer<Modules> get serializer => _$modulesSerializer;

  BuiltList<Module> get data;
  Links get links;
  Meta get meta;

  Modules._();
  factory Modules([void Function(ModulesBuilder) updates]) = _$Modules;
}

abstract class Module implements Built<Module, ModuleBuilder> {
  static Serializer<Module> get serializer => _$moduleSerializer;

  int get id;
  String get module;

  Module._();
  factory Module([void Function(ModuleBuilder) updates]) = _$Module;
}


// abstract class Data implements Built<Data, DataBuilder> {
//   static Serializer<Data>get serializer => _$dataSerializer;
//
//   int get id;
//   String get module;
//   Data._();
//   factory Data([void Function(DataBuilder) updates]) = _$Data;
// }
*/
