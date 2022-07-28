import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/branch/models/warehouse_model.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/entry/models/entry_model.dart';
import 'package:erp_fronted/entry_order/models/entry_order_model.dart';
import 'package:erp_fronted/entry_order/models/entry_order_product_model.dart';
import 'package:erp_fronted/invoice/models/invoice_model.dart';

import 'package:erp_fronted/module/models/module_model.dart';
import 'package:erp_fronted/product_entry/models/product_entry_model.dart';
import 'package:erp_fronted/product_request/models/product_transfer_model.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';
import 'package:erp_fronted/quotation/models/quotation_model.dart';
import 'package:erp_fronted/role/models/role_model.dart';
import 'package:erp_fronted/sale/models/sale_model.dart';
import 'package:erp_fronted/src/models/meta_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/transfer_order/models/b_inventory_model.dart';
import 'package:erp_fronted/transfer_order/models/transfer_order_model.dart';

import '../../branch/models/section_model.dart';
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
  Users,
  Section,
  Sections,
  Branch,
  Branches,
  Warehouse,
  Warehouses,
  Employee,
  EntryOrderProduct,
  EntryOrder,
  EntryOrders,
  ProductEntry,
  ProductEntries,
  Employees,
  Role,
  Roles,
  Transfers,
  Transfer,
  ProductTransfer,
  TransferOrders,
  TransferOrder,
  Entry,
  Entries,
  Quotations,
  Quotation,
  ProductQuotation,
  Sale,
  Sales,
  ProductSale,
  BInventories,
  BInventory,
  Invoices,
  Invoice,
])

Serializers serializers = _$serializers;

Serializers standardSerializers = (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();