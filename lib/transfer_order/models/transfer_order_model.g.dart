// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_order_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransferOrders> _$transferOrdersSerializer =
    new _$TransferOrdersSerializer();
Serializer<TransferOrder> _$transferOrderSerializer =
    new _$TransferOrderSerializer();

class _$TransferOrdersSerializer
    implements StructuredSerializer<TransferOrders> {
  @override
  final Iterable<Type> types = const [TransferOrders, _$TransferOrders];
  @override
  final String wireName = 'TransferOrders';

  @override
  Iterable<Object?> serialize(Serializers serializers, TransferOrders object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'transfer_orders',
      serializers.serialize(object.transferOrders,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TransferOrder)])),
    ];

    return result;
  }

  @override
  TransferOrders deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransferOrdersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'transfer_orders':
          result.transferOrders.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TransferOrder)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$TransferOrderSerializer implements StructuredSerializer<TransferOrder> {
  @override
  final Iterable<Type> types = const [TransferOrder, _$TransferOrder];
  @override
  final String wireName = 'TransferOrder';

  @override
  Iterable<Object?> serialize(Serializers serializers, TransferOrder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'sent',
      serializers.serialize(object.sent, specifiedType: const FullType(bool)),
      'received',
      serializers.serialize(object.received,
          specifiedType: const FullType(bool)),
      'transfer',
      serializers.serialize(object.transfer,
          specifiedType: const FullType(Transfer)),
    ];
    Object? value;
    value = object.receivedBy;
    if (value != null) {
      result
        ..add('received_by')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.sendBy;
    if (value != null) {
      result
        ..add('send_by')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.sendDate;
    if (value != null) {
      result
        ..add('send_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.receivedDate;
    if (value != null) {
      result
        ..add('received_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transferId;
    if (value != null) {
      result
        ..add('transfer_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sentByUser;
    if (value != null) {
      result
        ..add('sent_by_user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
    }
    value = object.receivedByUser;
    if (value != null) {
      result
        ..add('received_by_user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
    }
    return result;
  }

  @override
  TransferOrder deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransferOrderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'sent':
          result.sent = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'received':
          result.received = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'received_by':
          result.receivedBy = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'send_by':
          result.sendBy = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'send_date':
          result.sendDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'received_date':
          result.receivedDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transfer_id':
          result.transferId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transfer':
          result.transfer.replace(serializers.deserialize(value,
              specifiedType: const FullType(Transfer))! as Transfer);
          break;
        case 'sent_by_user':
          result.sentByUser.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
        case 'received_by_user':
          result.receivedByUser.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
      }
    }

    return result.build();
  }
}

class _$TransferOrders extends TransferOrders {
  @override
  final BuiltList<TransferOrder> transferOrders;

  factory _$TransferOrders([void Function(TransferOrdersBuilder)? updates]) =>
      (new TransferOrdersBuilder()..update(updates))._build();

  _$TransferOrders._({required this.transferOrders}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        transferOrders, 'TransferOrders', 'transferOrders');
  }

  @override
  TransferOrders rebuild(void Function(TransferOrdersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransferOrdersBuilder toBuilder() =>
      new TransferOrdersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransferOrders && transferOrders == other.transferOrders;
  }

  @override
  int get hashCode {
    return $jf($jc(0, transferOrders.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransferOrders')
          ..add('transferOrders', transferOrders))
        .toString();
  }
}

class TransferOrdersBuilder
    implements Builder<TransferOrders, TransferOrdersBuilder> {
  _$TransferOrders? _$v;

  ListBuilder<TransferOrder>? _transferOrders;
  ListBuilder<TransferOrder> get transferOrders =>
      _$this._transferOrders ??= new ListBuilder<TransferOrder>();
  set transferOrders(ListBuilder<TransferOrder>? transferOrders) =>
      _$this._transferOrders = transferOrders;

  TransferOrdersBuilder();

  TransferOrdersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transferOrders = $v.transferOrders.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransferOrders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransferOrders;
  }

  @override
  void update(void Function(TransferOrdersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransferOrders build() => _build();

  _$TransferOrders _build() {
    _$TransferOrders _$result;
    try {
      _$result =
          _$v ?? new _$TransferOrders._(transferOrders: transferOrders.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'transferOrders';
        transferOrders.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TransferOrders', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$TransferOrder extends TransferOrder {
  @override
  final int id;
  @override
  final bool sent;
  @override
  final bool received;
  @override
  final int? receivedBy;
  @override
  final int? sendBy;
  @override
  final String? sendDate;
  @override
  final String? receivedDate;
  @override
  final int? transferId;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final Transfer transfer;
  @override
  final User? sentByUser;
  @override
  final User? receivedByUser;

  factory _$TransferOrder([void Function(TransferOrderBuilder)? updates]) =>
      (new TransferOrderBuilder()..update(updates))._build();

  _$TransferOrder._(
      {required this.id,
      required this.sent,
      required this.received,
      this.receivedBy,
      this.sendBy,
      this.sendDate,
      this.receivedDate,
      this.transferId,
      this.createdAt,
      this.updatedAt,
      required this.transfer,
      this.sentByUser,
      this.receivedByUser})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'TransferOrder', 'id');
    BuiltValueNullFieldError.checkNotNull(sent, 'TransferOrder', 'sent');
    BuiltValueNullFieldError.checkNotNull(
        received, 'TransferOrder', 'received');
    BuiltValueNullFieldError.checkNotNull(
        transfer, 'TransferOrder', 'transfer');
  }

  @override
  TransferOrder rebuild(void Function(TransferOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransferOrderBuilder toBuilder() => new TransferOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransferOrder &&
        id == other.id &&
        sent == other.sent &&
        received == other.received &&
        receivedBy == other.receivedBy &&
        sendBy == other.sendBy &&
        sendDate == other.sendDate &&
        receivedDate == other.receivedDate &&
        transferId == other.transferId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        transfer == other.transfer &&
        sentByUser == other.sentByUser &&
        receivedByUser == other.receivedByUser;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, id.hashCode),
                                                    sent.hashCode),
                                                received.hashCode),
                                            receivedBy.hashCode),
                                        sendBy.hashCode),
                                    sendDate.hashCode),
                                receivedDate.hashCode),
                            transferId.hashCode),
                        createdAt.hashCode),
                    updatedAt.hashCode),
                transfer.hashCode),
            sentByUser.hashCode),
        receivedByUser.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransferOrder')
          ..add('id', id)
          ..add('sent', sent)
          ..add('received', received)
          ..add('receivedBy', receivedBy)
          ..add('sendBy', sendBy)
          ..add('sendDate', sendDate)
          ..add('receivedDate', receivedDate)
          ..add('transferId', transferId)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('transfer', transfer)
          ..add('sentByUser', sentByUser)
          ..add('receivedByUser', receivedByUser))
        .toString();
  }
}

class TransferOrderBuilder
    implements Builder<TransferOrder, TransferOrderBuilder> {
  _$TransferOrder? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  bool? _sent;
  bool? get sent => _$this._sent;
  set sent(bool? sent) => _$this._sent = sent;

  bool? _received;
  bool? get received => _$this._received;
  set received(bool? received) => _$this._received = received;

  int? _receivedBy;
  int? get receivedBy => _$this._receivedBy;
  set receivedBy(int? receivedBy) => _$this._receivedBy = receivedBy;

  int? _sendBy;
  int? get sendBy => _$this._sendBy;
  set sendBy(int? sendBy) => _$this._sendBy = sendBy;

  String? _sendDate;
  String? get sendDate => _$this._sendDate;
  set sendDate(String? sendDate) => _$this._sendDate = sendDate;

  String? _receivedDate;
  String? get receivedDate => _$this._receivedDate;
  set receivedDate(String? receivedDate) => _$this._receivedDate = receivedDate;

  int? _transferId;
  int? get transferId => _$this._transferId;
  set transferId(int? transferId) => _$this._transferId = transferId;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  TransferBuilder? _transfer;
  TransferBuilder get transfer => _$this._transfer ??= new TransferBuilder();
  set transfer(TransferBuilder? transfer) => _$this._transfer = transfer;

  UserBuilder? _sentByUser;
  UserBuilder get sentByUser => _$this._sentByUser ??= new UserBuilder();
  set sentByUser(UserBuilder? sentByUser) => _$this._sentByUser = sentByUser;

  UserBuilder? _receivedByUser;
  UserBuilder get receivedByUser =>
      _$this._receivedByUser ??= new UserBuilder();
  set receivedByUser(UserBuilder? receivedByUser) =>
      _$this._receivedByUser = receivedByUser;

  TransferOrderBuilder();

  TransferOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _sent = $v.sent;
      _received = $v.received;
      _receivedBy = $v.receivedBy;
      _sendBy = $v.sendBy;
      _sendDate = $v.sendDate;
      _receivedDate = $v.receivedDate;
      _transferId = $v.transferId;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _transfer = $v.transfer.toBuilder();
      _sentByUser = $v.sentByUser?.toBuilder();
      _receivedByUser = $v.receivedByUser?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransferOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransferOrder;
  }

  @override
  void update(void Function(TransferOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransferOrder build() => _build();

  _$TransferOrder _build() {
    _$TransferOrder _$result;
    try {
      _$result = _$v ??
          new _$TransferOrder._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, 'TransferOrder', 'id'),
              sent: BuiltValueNullFieldError.checkNotNull(
                  sent, 'TransferOrder', 'sent'),
              received: BuiltValueNullFieldError.checkNotNull(
                  received, 'TransferOrder', 'received'),
              receivedBy: receivedBy,
              sendBy: sendBy,
              sendDate: sendDate,
              receivedDate: receivedDate,
              transferId: transferId,
              createdAt: createdAt,
              updatedAt: updatedAt,
              transfer: transfer.build(),
              sentByUser: _sentByUser?.build(),
              receivedByUser: _receivedByUser?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'transfer';
        transfer.build();
        _$failedField = 'sentByUser';
        _sentByUser?.build();
        _$failedField = 'receivedByUser';
        _receivedByUser?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TransferOrder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
