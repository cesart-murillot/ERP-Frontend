import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/src/models/meta_model.dart';
import 'package:erp_fronted/src/models/serializers.dart';
import 'package:equatable/equatable.dart';

part 'module_model.g.dart';

abstract class Modules implements Built<Modules, ModulesBuilder> {
  static Serializer<Modules> get serializer => _$modulesSerializer;

  BuiltList<Module> get modules;
  LinkData get links;
  MetaData get meta;

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

Modules? parseModules(String jsonString){
  final parsed = jsonDecode(jsonString);
  Modules? modules = standardSerializers.deserializeWith(Modules.serializer, parsed);
  return modules;
}

Module? parseModule(String jsonString) {
  final parsed = jsonDecode(jsonString);
  Module? module = standardSerializers.deserializeWith(Module.serializer, parsed);
  return module;
}