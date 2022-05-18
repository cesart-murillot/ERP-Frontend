// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_order_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EntryOrders> _$entryOrdersSerializer = new _$EntryOrdersSerializer();
Serializer<EntryOrder> _$entryOrderSerializer = new _$EntryOrderSerializer();

class _$EntryOrdersSerializer implements StructuredSerializer<EntryOrders> {
  @override
  final Iterable<Type> types = const [EntryOrders, _$EntryOrders];
  @override
  final String wireName = 'EntryOrders';

  @override
  Iterable<Object?> serialize(Serializers serializers, EntryOrders object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'entry_orders',
      serializers.serialize(object.entryOrders,
          specifiedType:
              const FullType(BuiltList, const [const FullType(EntryOrder)])),
    ];

    return result;
  }

  @override
  EntryOrders deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntryOrdersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'entry_orders':
          result.entryOrders.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(EntryOrder)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$EntryOrderSerializer implements StructuredSerializer<EntryOrder> {
  @override
  final Iterable<Type> types = const [EntryOrder, _$EntryOrder];
  @override
  final String wireName = 'EntryOrder';

  @override
  Iterable<Object?> serialize(Serializers serializers, EntryOrder object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'code_entry_order',
      serializers.serialize(object.codeEntryOrder,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.verifiedEntryOrder;
    if (value != null) {
      result
        ..add('verified_entry_order')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.errorEntryOrder;
    if (value != null) {
      result
        ..add('error_entry_order')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.entryOrderProduct;
    if (value != null) {
      result
        ..add('entry_order_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(EntryOrderProduct)])));
    }
    return result;
  }

  @override
  EntryOrder deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntryOrderBuilder();

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
        case 'code_entry_order':
          result.codeEntryOrder = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'verified_entry_order':
          result.verifiedEntryOrder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'error_entry_order':
          result.errorEntryOrder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'entry_order_product':
          result.entryOrderProduct.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(EntryOrderProduct)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$EntryOrders extends EntryOrders {
  @override
  final BuiltList<EntryOrder> entryOrders;

  factory _$EntryOrders([void Function(EntryOrdersBuilder)? updates]) =>
      (new EntryOrdersBuilder()..update(updates))._build();

  _$EntryOrders._({required this.entryOrders}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        entryOrders, 'EntryOrders', 'entryOrders');
  }

  @override
  EntryOrders rebuild(void Function(EntryOrdersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryOrdersBuilder toBuilder() => new EntryOrdersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryOrders && entryOrders == other.entryOrders;
  }

  @override
  int get hashCode {
    return $jf($jc(0, entryOrders.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntryOrders')
          ..add('entryOrders', entryOrders))
        .toString();
  }
}

class EntryOrdersBuilder implements Builder<EntryOrders, EntryOrdersBuilder> {
  _$EntryOrders? _$v;

  ListBuilder<EntryOrder>? _entryOrders;
  ListBuilder<EntryOrder> get entryOrders =>
      _$this._entryOrders ??= new ListBuilder<EntryOrder>();
  set entryOrders(ListBuilder<EntryOrder>? entryOrders) =>
      _$this._entryOrders = entryOrders;

  EntryOrdersBuilder();

  EntryOrdersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _entryOrders = $v.entryOrders.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryOrders other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EntryOrders;
  }

  @override
  void update(void Function(EntryOrdersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EntryOrders build() => _build();

  _$EntryOrders _build() {
    _$EntryOrders _$result;
    try {
      _$result = _$v ?? new _$EntryOrders._(entryOrders: entryOrders.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entryOrders';
        entryOrders.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EntryOrders', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$EntryOrder extends EntryOrder {
  @override
  final int? id;
  @override
  final String codeEntryOrder;
  @override
  final String? createdAt;
  @override
  final bool? verifiedEntryOrder;
  @override
  final bool? errorEntryOrder;
  @override
  final BuiltList<EntryOrderProduct>? entryOrderProduct;

  factory _$EntryOrder([void Function(EntryOrderBuilder)? updates]) =>
      (new EntryOrderBuilder()..update(updates))._build();

  _$EntryOrder._(
      {this.id,
      required this.codeEntryOrder,
      this.createdAt,
      this.verifiedEntryOrder,
      this.errorEntryOrder,
      this.entryOrderProduct})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        codeEntryOrder, 'EntryOrder', 'codeEntryOrder');
  }

  @override
  EntryOrder rebuild(void Function(EntryOrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryOrderBuilder toBuilder() => new EntryOrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryOrder &&
        id == other.id &&
        codeEntryOrder == other.codeEntryOrder &&
        createdAt == other.createdAt &&
        verifiedEntryOrder == other.verifiedEntryOrder &&
        errorEntryOrder == other.errorEntryOrder &&
        entryOrderProduct == other.entryOrderProduct;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), codeEntryOrder.hashCode),
                    createdAt.hashCode),
                verifiedEntryOrder.hashCode),
            errorEntryOrder.hashCode),
        entryOrderProduct.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntryOrder')
          ..add('id', id)
          ..add('codeEntryOrder', codeEntryOrder)
          ..add('createdAt', createdAt)
          ..add('verifiedEntryOrder', verifiedEntryOrder)
          ..add('errorEntryOrder', errorEntryOrder)
          ..add('entryOrderProduct', entryOrderProduct))
        .toString();
  }
}

class EntryOrderBuilder implements Builder<EntryOrder, EntryOrderBuilder> {
  _$EntryOrder? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _codeEntryOrder;
  String? get codeEntryOrder => _$this._codeEntryOrder;
  set codeEntryOrder(String? codeEntryOrder) =>
      _$this._codeEntryOrder = codeEntryOrder;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  bool? _verifiedEntryOrder;
  bool? get verifiedEntryOrder => _$this._verifiedEntryOrder;
  set verifiedEntryOrder(bool? verifiedEntryOrder) =>
      _$this._verifiedEntryOrder = verifiedEntryOrder;

  bool? _errorEntryOrder;
  bool? get errorEntryOrder => _$this._errorEntryOrder;
  set errorEntryOrder(bool? errorEntryOrder) =>
      _$this._errorEntryOrder = errorEntryOrder;

  ListBuilder<EntryOrderProduct>? _entryOrderProduct;
  ListBuilder<EntryOrderProduct> get entryOrderProduct =>
      _$this._entryOrderProduct ??= new ListBuilder<EntryOrderProduct>();
  set entryOrderProduct(ListBuilder<EntryOrderProduct>? entryOrderProduct) =>
      _$this._entryOrderProduct = entryOrderProduct;

  EntryOrderBuilder();

  EntryOrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _codeEntryOrder = $v.codeEntryOrder;
      _createdAt = $v.createdAt;
      _verifiedEntryOrder = $v.verifiedEntryOrder;
      _errorEntryOrder = $v.errorEntryOrder;
      _entryOrderProduct = $v.entryOrderProduct?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryOrder other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EntryOrder;
  }

  @override
  void update(void Function(EntryOrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EntryOrder build() => _build();

  _$EntryOrder _build() {
    _$EntryOrder _$result;
    try {
      _$result = _$v ??
          new _$EntryOrder._(
              id: id,
              codeEntryOrder: BuiltValueNullFieldError.checkNotNull(
                  codeEntryOrder, 'EntryOrder', 'codeEntryOrder'),
              createdAt: createdAt,
              verifiedEntryOrder: verifiedEntryOrder,
              errorEntryOrder: errorEntryOrder,
              entryOrderProduct: _entryOrderProduct?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entryOrderProduct';
        _entryOrderProduct?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EntryOrder', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
