import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:erp_fronted/src/branches.dart';
import 'package:erp_fronted/src/meta_link.dart';
import 'package:erp_fronted/src/products.dart';
import 'modules.dart';

part 'serializers.g.dart';

@SerializersFor([
  Modules,
  Branches,
  Products,
  Meta,
  Links,
])

Serializers serializers = _$serializers;

Serializers standardSerializers = (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();