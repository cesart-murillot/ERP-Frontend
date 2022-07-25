// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Warehouses> _$warehousesSerializer = new _$WarehousesSerializer();
Serializer<Warehouse> _$warehouseSerializer = new _$WarehouseSerializer();

class _$WarehousesSerializer implements StructuredSerializer<Warehouses> {
  @override
  final Iterable<Type> types = const [Warehouses, _$Warehouses];
  @override
  final String wireName = 'Warehouses';

  @override
  Iterable<Object?> serialize(Serializers serializers, Warehouses object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'warehouses',
      serializers.serialize(object.warehouses,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Warehouse)])),
    ];

    return result;
  }

  @override
  Warehouses deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WarehousesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'warehouses':
          result.warehouses.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Warehouse)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$WarehouseSerializer implements StructuredSerializer<Warehouse> {
  @override
  final Iterable<Type> types = const [Warehouse, _$Warehouse];
  @override
  final String wireName = 'Warehouse';

  @override
  Iterable<Object?> serialize(Serializers serializers, Warehouse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name_warehouse',
      serializers.serialize(object.nameWarehouse,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.branchId;
    if (value != null) {
      result
        ..add('branch_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.sections;
    if (value != null) {
      result
        ..add('sections')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Section)])));
    }
    return result;
  }

  @override
  Warehouse deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WarehouseBuilder();

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
        case 'name_warehouse':
          result.nameWarehouse = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'branch_id':
          result.branchId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'sections':
          result.sections.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Section)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Warehouses extends Warehouses {
  @override
  final BuiltList<Warehouse> warehouses;

  factory _$Warehouses([void Function(WarehousesBuilder)? updates]) =>
      (new WarehousesBuilder()..update(updates))._build();

  _$Warehouses._({required this.warehouses}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        warehouses, 'Warehouses', 'warehouses');
  }

  @override
  Warehouses rebuild(void Function(WarehousesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WarehousesBuilder toBuilder() => new WarehousesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Warehouses && warehouses == other.warehouses;
  }

  @override
  int get hashCode {
    return $jf($jc(0, warehouses.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Warehouses')
          ..add('warehouses', warehouses))
        .toString();
  }
}

class WarehousesBuilder implements Builder<Warehouses, WarehousesBuilder> {
  _$Warehouses? _$v;

  ListBuilder<Warehouse>? _warehouses;
  ListBuilder<Warehouse> get warehouses =>
      _$this._warehouses ??= new ListBuilder<Warehouse>();
  set warehouses(ListBuilder<Warehouse>? warehouses) =>
      _$this._warehouses = warehouses;

  WarehousesBuilder();

  WarehousesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _warehouses = $v.warehouses.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Warehouses other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Warehouses;
  }

  @override
  void update(void Function(WarehousesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Warehouses build() => _build();

  _$Warehouses _build() {
    _$Warehouses _$result;
    try {
      _$result = _$v ?? new _$Warehouses._(warehouses: warehouses.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'warehouses';
        warehouses.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Warehouses', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Warehouse extends Warehouse {
  @override
  final int? id;
  @override
  final String nameWarehouse;
  @override
  final int? branchId;
  @override
  final BuiltList<Section>? sections;

  factory _$Warehouse([void Function(WarehouseBuilder)? updates]) =>
      (new WarehouseBuilder()..update(updates))._build();

  _$Warehouse._(
      {this.id, required this.nameWarehouse, this.branchId, this.sections})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        nameWarehouse, 'Warehouse', 'nameWarehouse');
  }

  @override
  Warehouse rebuild(void Function(WarehouseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WarehouseBuilder toBuilder() => new WarehouseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Warehouse &&
        id == other.id &&
        nameWarehouse == other.nameWarehouse &&
        branchId == other.branchId &&
        sections == other.sections;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), nameWarehouse.hashCode),
            branchId.hashCode),
        sections.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Warehouse')
          ..add('id', id)
          ..add('nameWarehouse', nameWarehouse)
          ..add('branchId', branchId)
          ..add('sections', sections))
        .toString();
  }
}

class WarehouseBuilder implements Builder<Warehouse, WarehouseBuilder> {
  _$Warehouse? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _nameWarehouse;
  String? get nameWarehouse => _$this._nameWarehouse;
  set nameWarehouse(String? nameWarehouse) =>
      _$this._nameWarehouse = nameWarehouse;

  int? _branchId;
  int? get branchId => _$this._branchId;
  set branchId(int? branchId) => _$this._branchId = branchId;

  ListBuilder<Section>? _sections;
  ListBuilder<Section> get sections =>
      _$this._sections ??= new ListBuilder<Section>();
  set sections(ListBuilder<Section>? sections) => _$this._sections = sections;

  WarehouseBuilder();

  WarehouseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nameWarehouse = $v.nameWarehouse;
      _branchId = $v.branchId;
      _sections = $v.sections?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Warehouse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Warehouse;
  }

  @override
  void update(void Function(WarehouseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Warehouse build() => _build();

  _$Warehouse _build() {
    _$Warehouse _$result;
    try {
      _$result = _$v ??
          new _$Warehouse._(
              id: id,
              nameWarehouse: BuiltValueNullFieldError.checkNotNull(
                  nameWarehouse, 'Warehouse', 'nameWarehouse'),
              branchId: branchId,
              sections: _sections?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sections';
        _sections?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Warehouse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
