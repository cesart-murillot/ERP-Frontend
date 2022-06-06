import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/product_request/models/transfer_model.dart';

part 'transfer_order_model.g.dart';

abstract class TransferOrders implements Built<TransferOrders, TransferOrdersBuilder> {
  static Serializer<TransferOrders> get serializer => _$transferOrdersSerializer;

  @BuiltValueField(wireName: 'transfer_orders')
  BuiltList<TransferOrder> get transferOrders;

  TransferOrders._();
  factory TransferOrders([void Function(TransferOrdersBuilder) updates]) = _$TransferOrders;
}

abstract class TransferOrder implements Built<TransferOrder, TransferOrderBuilder> {
  static Serializer<TransferOrder> get serializer => _$transferOrderSerializer;

  int get id;
  bool get sent;
  bool get received;

  @BuiltValueField(wireName: 'received_by')
  int? get receivedBy;

  @BuiltValueField(wireName: 'send_by')
  int? get sendBy;

  @BuiltValueField(wireName: 'send_date')
  String? get sendDate;

  @BuiltValueField(wireName: 'received_date')
  String? get receivedDate;

  @BuiltValueField(wireName: 'transfer_id')
  int? get transferId;

  @BuiltValueField(wireName: 'created_at')
  String? get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  String? get updatedAt;

  Transfer get transfer;

  @BuiltValueField(wireName: 'sent_by_user')
  User? get sentByUser;

  @BuiltValueField(wireName: 'received_by_user')
  User? get receivedByUser;

  TransferOrder._();
  factory TransferOrder([void Function(TransferOrderBuilder) updates]) = _$TransferOrder;
}