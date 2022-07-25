// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'b_inventory_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BInventories> _$bInventoriesSerializer =
    new _$BInventoriesSerializer();
Serializer<BInventory> _$bInventorySerializer = new _$BInventorySerializer();

class _$BInventoriesSerializer implements StructuredSerializer<BInventories> {
  @override
  final Iterable<Type> types = const [BInventories, _$BInventories];
  @override
  final String wireName = 'BInventories';

  @override
  Iterable<Object?> serialize(Serializers serializers, BInventories object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'b_inventories',
      serializers.serialize(object.bInventories,
          specifiedType:
              const FullType(BuiltList, const [const FullType(BInventory)])),
    ];

    return result;
  }

  @override
  BInventories deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BInventoriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'b_inventories':
          result.bInventories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(BInventory)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$BInventorySerializer implements StructuredSerializer<BInventory> {
  @override
  final Iterable<Type> types = const [BInventory, _$BInventory];
  @override
  final String wireName = 'BInventory';

  @override
  Iterable<Object?> serialize(Serializers serializers, BInventory object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(int)),
      'product_id',
      serializers.serialize(object.productId,
          specifiedType: const FullType(int)),
      'section_id',
      serializers.serialize(object.sectionId,
          specifiedType: const FullType(int)),
      'product_transfer_id',
      serializers.serialize(object.productTransferId,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.remainUnits;
    if (value != null) {
      result
        ..add('remain_units')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  BInventory deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BInventoryBuilder();

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
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'remain_units':
          result.remainUnits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'product_id':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'section_id':
          result.sectionId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'product_transfer_id':
          result.productTransferId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$BInventories extends BInventories {
  @override
  final BuiltList<BInventory> bInventories;

  factory _$BInventories([void Function(BInventoriesBuilder)? updates]) =>
      (new BInventoriesBuilder()..update(updates))._build();

  _$BInventories._({required this.bInventories}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        bInventories, 'BInventories', 'bInventories');
  }

  @override
  BInventories rebuild(void Function(BInventoriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BInventoriesBuilder toBuilder() => new BInventoriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BInventories && bInventories == other.bInventories;
  }

  @override
  int get hashCode {
    return $jf($jc(0, bInventories.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BInventories')
          ..add('bInventories', bInventories))
        .toString();
  }
}

class BInventoriesBuilder
    implements Builder<BInventories, BInventoriesBuilder> {
  _$BInventories? _$v;

  ListBuilder<BInventory>? _bInventories;
  ListBuilder<BInventory> get bInventories =>
      _$this._bInventories ??= new ListBuilder<BInventory>();
  set bInventories(ListBuilder<BInventory>? bInventories) =>
      _$this._bInventories = bInventories;

  BInventoriesBuilder();

  BInventoriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bInventories = $v.bInventories.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BInventories other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BInventories;
  }

  @override
  void update(void Function(BInventoriesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BInventories build() => _build();

  _$BInventories _build() {
    _$BInventories _$result;
    try {
      _$result =
          _$v ?? new _$BInventories._(bInventories: bInventories.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'bInventories';
        bInventories.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BInventories', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$BInventory extends BInventory {
  @override
  final int? id;
  @override
  final int quantity;
  @override
  final int? remainUnits;
  @override
  final int productId;
  @override
  final int sectionId;
  @override
  final int? userId;
  @override
  final int productTransferId;

  factory _$BInventory([void Function(BInventoryBuilder)? updates]) =>
      (new BInventoryBuilder()..update(updates))._build();

  _$BInventory._(
      {this.id,
      required this.quantity,
      this.remainUnits,
      required this.productId,
      required this.sectionId,
      this.userId,
      required this.productTransferId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(quantity, 'BInventory', 'quantity');
    BuiltValueNullFieldError.checkNotNull(productId, 'BInventory', 'productId');
    BuiltValueNullFieldError.checkNotNull(sectionId, 'BInventory', 'sectionId');
    BuiltValueNullFieldError.checkNotNull(
        productTransferId, 'BInventory', 'productTransferId');
  }

  @override
  BInventory rebuild(void Function(BInventoryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BInventoryBuilder toBuilder() => new BInventoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BInventory &&
        id == other.id &&
        quantity == other.quantity &&
        remainUnits == other.remainUnits &&
        productId == other.productId &&
        sectionId == other.sectionId &&
        userId == other.userId &&
        productTransferId == other.productTransferId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), quantity.hashCode),
                        remainUnits.hashCode),
                    productId.hashCode),
                sectionId.hashCode),
            userId.hashCode),
        productTransferId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BInventory')
          ..add('id', id)
          ..add('quantity', quantity)
          ..add('remainUnits', remainUnits)
          ..add('productId', productId)
          ..add('sectionId', sectionId)
          ..add('userId', userId)
          ..add('productTransferId', productTransferId))
        .toString();
  }
}

class BInventoryBuilder implements Builder<BInventory, BInventoryBuilder> {
  _$BInventory? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  int? _remainUnits;
  int? get remainUnits => _$this._remainUnits;
  set remainUnits(int? remainUnits) => _$this._remainUnits = remainUnits;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

  int? _sectionId;
  int? get sectionId => _$this._sectionId;
  set sectionId(int? sectionId) => _$this._sectionId = sectionId;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  int? _productTransferId;
  int? get productTransferId => _$this._productTransferId;
  set productTransferId(int? productTransferId) =>
      _$this._productTransferId = productTransferId;

  BInventoryBuilder();

  BInventoryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _quantity = $v.quantity;
      _remainUnits = $v.remainUnits;
      _productId = $v.productId;
      _sectionId = $v.sectionId;
      _userId = $v.userId;
      _productTransferId = $v.productTransferId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BInventory other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BInventory;
  }

  @override
  void update(void Function(BInventoryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BInventory build() => _build();

  _$BInventory _build() {
    final _$result = _$v ??
        new _$BInventory._(
            id: id,
            quantity: BuiltValueNullFieldError.checkNotNull(
                quantity, 'BInventory', 'quantity'),
            remainUnits: remainUnits,
            productId: BuiltValueNullFieldError.checkNotNull(
                productId, 'BInventory', 'productId'),
            sectionId: BuiltValueNullFieldError.checkNotNull(
                sectionId, 'BInventory', 'sectionId'),
            userId: userId,
            productTransferId: BuiltValueNullFieldError.checkNotNull(
                productTransferId, 'BInventory', 'productTransferId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
