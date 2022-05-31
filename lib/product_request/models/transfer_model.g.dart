// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Transfers> _$transfersSerializer = new _$TransfersSerializer();
Serializer<Transfer> _$transferSerializer = new _$TransferSerializer();

class _$TransfersSerializer implements StructuredSerializer<Transfers> {
  @override
  final Iterable<Type> types = const [Transfers, _$Transfers];
  @override
  final String wireName = 'Transfers';

  @override
  Iterable<Object?> serialize(Serializers serializers, Transfers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'transfers',
      serializers.serialize(object.transfers,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Transfer)])),
    ];

    return result;
  }

  @override
  Transfers deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransfersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'transfers':
          result.transfers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Transfer)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$TransferSerializer implements StructuredSerializer<Transfer> {
  @override
  final Iterable<Type> types = const [Transfer, _$Transfer];
  @override
  final String wireName = 'Transfer';

  @override
  Iterable<Object?> serialize(Serializers serializers, Transfer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'branch_id',
      serializers.serialize(object.branchId,
          specifiedType: const FullType(int)),
      'user_id',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'product_transfers',
      serializers.serialize(object.productTransfers,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ProductTransfer)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.verified;
    if (value != null) {
      result
        ..add('verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
    }
    value = object.branch;
    if (value != null) {
      result
        ..add('branch')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Branch)));
    }
    return result;
  }

  @override
  Transfer deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransferBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'branch_id':
          result.branchId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'verified':
          result.verified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
        case 'branch':
          result.branch.replace(serializers.deserialize(value,
              specifiedType: const FullType(Branch))! as Branch);
          break;
        case 'product_transfers':
          result.productTransfers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductTransfer)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Transfers extends Transfers {
  @override
  final BuiltList<Transfer> transfers;

  factory _$Transfers([void Function(TransfersBuilder)? updates]) =>
      (new TransfersBuilder()..update(updates))._build();

  _$Transfers._({required this.transfers}) : super._() {
    BuiltValueNullFieldError.checkNotNull(transfers, 'Transfers', 'transfers');
  }

  @override
  Transfers rebuild(void Function(TransfersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransfersBuilder toBuilder() => new TransfersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Transfers && transfers == other.transfers;
  }

  @override
  int get hashCode {
    return $jf($jc(0, transfers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Transfers')
          ..add('transfers', transfers))
        .toString();
  }
}

class TransfersBuilder implements Builder<Transfers, TransfersBuilder> {
  _$Transfers? _$v;

  ListBuilder<Transfer>? _transfers;
  ListBuilder<Transfer> get transfers =>
      _$this._transfers ??= new ListBuilder<Transfer>();
  set transfers(ListBuilder<Transfer>? transfers) =>
      _$this._transfers = transfers;

  TransfersBuilder();

  TransfersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transfers = $v.transfers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Transfers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Transfers;
  }

  @override
  void update(void Function(TransfersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Transfers build() => _build();

  _$Transfers _build() {
    _$Transfers _$result;
    try {
      _$result = _$v ?? new _$Transfers._(transfers: transfers.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'transfers';
        transfers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Transfers', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Transfer extends Transfer {
  @override
  final int? id;
  @override
  final int branchId;
  @override
  final int userId;
  @override
  final bool? verified;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final User? user;
  @override
  final Branch? branch;
  @override
  final BuiltList<ProductTransfer> productTransfers;

  factory _$Transfer([void Function(TransferBuilder)? updates]) =>
      (new TransferBuilder()..update(updates))._build();

  _$Transfer._(
      {this.id,
      required this.branchId,
      required this.userId,
      this.verified,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.branch,
      required this.productTransfers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(branchId, 'Transfer', 'branchId');
    BuiltValueNullFieldError.checkNotNull(userId, 'Transfer', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        productTransfers, 'Transfer', 'productTransfers');
  }

  @override
  Transfer rebuild(void Function(TransferBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransferBuilder toBuilder() => new TransferBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Transfer &&
        id == other.id &&
        branchId == other.branchId &&
        userId == other.userId &&
        verified == other.verified &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        user == other.user &&
        branch == other.branch &&
        productTransfers == other.productTransfers;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), branchId.hashCode),
                                userId.hashCode),
                            verified.hashCode),
                        createdAt.hashCode),
                    updatedAt.hashCode),
                user.hashCode),
            branch.hashCode),
        productTransfers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Transfer')
          ..add('id', id)
          ..add('branchId', branchId)
          ..add('userId', userId)
          ..add('verified', verified)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('user', user)
          ..add('branch', branch)
          ..add('productTransfers', productTransfers))
        .toString();
  }
}

class TransferBuilder implements Builder<Transfer, TransferBuilder> {
  _$Transfer? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _branchId;
  int? get branchId => _$this._branchId;
  set branchId(int? branchId) => _$this._branchId = branchId;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(bool? verified) => _$this._verified = verified;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  BranchBuilder? _branch;
  BranchBuilder get branch => _$this._branch ??= new BranchBuilder();
  set branch(BranchBuilder? branch) => _$this._branch = branch;

  ListBuilder<ProductTransfer>? _productTransfers;
  ListBuilder<ProductTransfer> get productTransfers =>
      _$this._productTransfers ??= new ListBuilder<ProductTransfer>();
  set productTransfers(ListBuilder<ProductTransfer>? productTransfers) =>
      _$this._productTransfers = productTransfers;

  TransferBuilder();

  TransferBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _branchId = $v.branchId;
      _userId = $v.userId;
      _verified = $v.verified;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _user = $v.user?.toBuilder();
      _branch = $v.branch?.toBuilder();
      _productTransfers = $v.productTransfers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Transfer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Transfer;
  }

  @override
  void update(void Function(TransferBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Transfer build() => _build();

  _$Transfer _build() {
    _$Transfer _$result;
    try {
      _$result = _$v ??
          new _$Transfer._(
              id: id,
              branchId: BuiltValueNullFieldError.checkNotNull(
                  branchId, 'Transfer', 'branchId'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, 'Transfer', 'userId'),
              verified: verified,
              createdAt: createdAt,
              updatedAt: updatedAt,
              user: _user?.build(),
              branch: _branch?.build(),
              productTransfers: productTransfers.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'branch';
        _branch?.build();
        _$failedField = 'productTransfers';
        productTransfers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Transfer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
