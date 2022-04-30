import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:erp_fronted/src/models/meta_model.dart';
import 'package:erp_fronted/src/models/product_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  ProductData,
  Product,
  LinkData,
  MetaData
])

Serializers serializers = _$serializers;

Serializers standardSerializers = (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();