import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/branch/models/warehouse_model.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/module/models/module_model.dart';
import 'package:erp_fronted/src/models/meta_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';

import '../../employee/models/employee_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  Products,
  Product,
  LinkData,
  MetaData,
  Modules,
  Module,
  User,
  Branch,
  Branches,
  Warehouse,
  Warehouses,
  Employee,
])

Serializers serializers = _$serializers;

Serializers standardSerializers = (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();