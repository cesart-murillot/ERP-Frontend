import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/product_request/models/product_transfer_model.dart';

part 'transfer_model.g.dart';

abstract class Transfers implements Built<Transfers, TransfersBuilder> {
  static Serializer<Transfers> get serializer => _$transfersSerializer;

  BuiltList<Transfer> get transfers;

  Transfers._();
  factory Transfers([void Function(TransfersBuilder) updates]) = _$Transfers;
}

abstract class Transfer implements Built<Transfer, TransferBuilder> {
  static Serializer<Transfer> get serializer => _$transferSerializer;

  @BuiltValueField(wireName: 'id')
  int? get id;

  @BuiltValueField(wireName: 'branch_id')
  int get branchId;

  @BuiltValueField(wireName: 'user_id')
  int get userId;

  bool? get verified;

  @BuiltValueField(wireName: 'created_at')
  String? get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String? get updatedAt;

  User? get user;

  Branch? get branch;

  @BuiltValueField(wireName: 'product_transfers')
  BuiltList<ProductTransfer> get productTransfers;

  Transfer._();
  factory Transfer([void Function(TransferBuilder) updates]) = _$Transfer;
}