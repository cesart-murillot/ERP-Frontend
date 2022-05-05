import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:erp_fronted/module/modules/module_model.dart';
import 'package:erp_fronted/src/models/meta_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  Products,
  Product,
  LinkData,
  MetaData,
  Modules,
  Module
])

Serializers serializers = _$serializers;

Serializers standardSerializers = (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();