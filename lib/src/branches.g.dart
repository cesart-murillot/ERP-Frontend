// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Branches> _$branchesSerializer = new _$BranchesSerializer();
Serializer<Data> _$dataSerializer = new _$DataSerializer();
Serializer<Warehouses> _$warehousesSerializer = new _$WarehousesSerializer();
Serializer<Sections> _$sectionsSerializer = new _$SectionsSerializer();

class _$BranchesSerializer implements StructuredSerializer<Branches> {
  @override
  final Iterable<Type> types = const [Branches, _$Branches];
  @override
  final String wireName = 'Branches';

  @override
  Iterable<Object?> serialize(Serializers serializers, Branches object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'data',
      serializers.serialize(object.data,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Data)])),
      'links',
      serializers.serialize(object.links, specifiedType: const FullType(Links)),
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(Meta)),
    ];

    return result;
  }

  @override
  Branches deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BranchesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Data)]))!
              as BuiltList<Object?>);
          break;
        case 'links':
          result.links.replace(serializers.deserialize(value,
              specifiedType: const FullType(Links))! as Links);
          break;
        case 'meta':
          result.meta.replace(serializers.deserialize(value,
              specifiedType: const FullType(Meta))! as Meta);
          break;
      }
    }

    return result.build();
  }
}

class _$DataSerializer implements StructuredSerializer<Data> {
  @override
  final Iterable<Type> types = const [Data, _$Data];
  @override
  final String wireName = 'Data';

  @override
  Iterable<Object?> serialize(Serializers serializers, Data object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.warehouses;
    if (value != null) {
      result
        ..add('warehouses')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Warehouses)])));
    }
    return result;
  }

  @override
  Data deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'warehouses':
          result.warehouses.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Warehouses)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$WarehousesSerializer implements StructuredSerializer<Warehouses> {
  @override
  final Iterable<Type> types = const [Warehouses, _$Warehouses];
  @override
  final String wireName = 'Warehouses';

  @override
  Iterable<Object?> serialize(Serializers serializers, Warehouses object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.sections;
    if (value != null) {
      result
        ..add('sections')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Sections)])));
    }
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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'sections':
          result.sections.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Sections)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$SectionsSerializer implements StructuredSerializer<Sections> {
  @override
  final Iterable<Type> types = const [Sections, _$Sections];
  @override
  final String wireName = 'Sections';

  @override
  Iterable<Object?> serialize(Serializers serializers, Sections object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name_section',
      serializers.serialize(object.name_section,
          specifiedType: const FullType(String)),
      'warehouse_id',
      serializers.serialize(object.warehouse_id,
          specifiedType: const FullType(int)),
      'created_at',
      serializers.serialize(object.created_at,
          specifiedType: const FullType(String)),
      'updated_at',
      serializers.serialize(object.updated_at,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.deleted_at;
    if (value != null) {
      result
        ..add('deleted_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Sections deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SectionsBuilder();

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
        case 'name_section':
          result.name_section = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'warehouse_id':
          result.warehouse_id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'updated_at':
          result.updated_at = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'deleted_at':
          result.deleted_at = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Branches extends Branches {
  @override
  final BuiltList<Data> data;
  @override
  final Links links;
  @override
  final Meta meta;

  factory _$Branches([void Function(BranchesBuilder)? updates]) =>
      (new BranchesBuilder()..update(updates)).build();

  _$Branches._({required this.data, required this.links, required this.meta})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, 'Branches', 'data');
    BuiltValueNullFieldError.checkNotNull(links, 'Branches', 'links');
    BuiltValueNullFieldError.checkNotNull(meta, 'Branches', 'meta');
  }

  @override
  Branches rebuild(void Function(BranchesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BranchesBuilder toBuilder() => new BranchesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Branches &&
        data == other.data &&
        links == other.links &&
        meta == other.meta;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, data.hashCode), links.hashCode), meta.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Branches')
          ..add('data', data)
          ..add('links', links)
          ..add('meta', meta))
        .toString();
  }
}

class BranchesBuilder implements Builder<Branches, BranchesBuilder> {
  _$Branches? _$v;

  ListBuilder<Data>? _data;
  ListBuilder<Data> get data => _$this._data ??= new ListBuilder<Data>();
  set data(ListBuilder<Data>? data) => _$this._data = data;

  LinksBuilder? _links;
  LinksBuilder get links => _$this._links ??= new LinksBuilder();
  set links(LinksBuilder? links) => _$this._links = links;

  MetaBuilder? _meta;
  MetaBuilder get meta => _$this._meta ??= new MetaBuilder();
  set meta(MetaBuilder? meta) => _$this._meta = meta;

  BranchesBuilder();

  BranchesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _links = $v.links.toBuilder();
      _meta = $v.meta.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Branches other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Branches;
  }

  @override
  void update(void Function(BranchesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Branches build() {
    _$Branches _$result;
    try {
      _$result = _$v ??
          new _$Branches._(
              data: data.build(), links: links.build(), meta: meta.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
        _$failedField = 'links';
        links.build();
        _$failedField = 'meta';
        meta.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Branches', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Data extends Data {
  @override
  final String name;
  @override
  final String address;
  @override
  final BuiltList<Warehouses>? warehouses;

  factory _$Data([void Function(DataBuilder)? updates]) =>
      (new DataBuilder()..update(updates)).build();

  _$Data._({required this.name, required this.address, this.warehouses})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Data', 'name');
    BuiltValueNullFieldError.checkNotNull(address, 'Data', 'address');
  }

  @override
  Data rebuild(void Function(DataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataBuilder toBuilder() => new DataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Data &&
        name == other.name &&
        address == other.address &&
        warehouses == other.warehouses;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), address.hashCode), warehouses.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Data')
          ..add('name', name)
          ..add('address', address)
          ..add('warehouses', warehouses))
        .toString();
  }
}

class DataBuilder implements Builder<Data, DataBuilder> {
  _$Data? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  ListBuilder<Warehouses>? _warehouses;
  ListBuilder<Warehouses> get warehouses =>
      _$this._warehouses ??= new ListBuilder<Warehouses>();
  set warehouses(ListBuilder<Warehouses>? warehouses) =>
      _$this._warehouses = warehouses;

  DataBuilder();

  DataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _address = $v.address;
      _warehouses = $v.warehouses?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Data other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Data;
  }

  @override
  void update(void Function(DataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Data build() {
    _$Data _$result;
    try {
      _$result = _$v ??
          new _$Data._(
              name: BuiltValueNullFieldError.checkNotNull(name, 'Data', 'name'),
              address: BuiltValueNullFieldError.checkNotNull(
                  address, 'Data', 'address'),
              warehouses: _warehouses?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'warehouses';
        _warehouses?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Data', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Warehouses extends Warehouses {
  @override
  final String name;
  @override
  final BuiltList<Sections>? sections;

  factory _$Warehouses([void Function(WarehousesBuilder)? updates]) =>
      (new WarehousesBuilder()..update(updates)).build();

  _$Warehouses._({required this.name, this.sections}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Warehouses', 'name');
  }

  @override
  Warehouses rebuild(void Function(WarehousesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WarehousesBuilder toBuilder() => new WarehousesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Warehouses &&
        name == other.name &&
        sections == other.sections;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), sections.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Warehouses')
          ..add('name', name)
          ..add('sections', sections))
        .toString();
  }
}

class WarehousesBuilder implements Builder<Warehouses, WarehousesBuilder> {
  _$Warehouses? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<Sections>? _sections;
  ListBuilder<Sections> get sections =>
      _$this._sections ??= new ListBuilder<Sections>();
  set sections(ListBuilder<Sections>? sections) => _$this._sections = sections;

  WarehousesBuilder();

  WarehousesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _sections = $v.sections?.toBuilder();
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
  _$Warehouses build() {
    _$Warehouses _$result;
    try {
      _$result = _$v ??
          new _$Warehouses._(
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'Warehouses', 'name'),
              sections: _sections?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sections';
        _sections?.build();
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

class _$Sections extends Sections {
  @override
  final int id;
  @override
  final String name_section;
  @override
  final int warehouse_id;
  @override
  final String created_at;
  @override
  final String updated_at;
  @override
  final String? deleted_at;

  factory _$Sections([void Function(SectionsBuilder)? updates]) =>
      (new SectionsBuilder()..update(updates)).build();

  _$Sections._(
      {required this.id,
      required this.name_section,
      required this.warehouse_id,
      required this.created_at,
      required this.updated_at,
      this.deleted_at})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Sections', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name_section, 'Sections', 'name_section');
    BuiltValueNullFieldError.checkNotNull(
        warehouse_id, 'Sections', 'warehouse_id');
    BuiltValueNullFieldError.checkNotNull(created_at, 'Sections', 'created_at');
    BuiltValueNullFieldError.checkNotNull(updated_at, 'Sections', 'updated_at');
  }

  @override
  Sections rebuild(void Function(SectionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SectionsBuilder toBuilder() => new SectionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Sections &&
        id == other.id &&
        name_section == other.name_section &&
        warehouse_id == other.warehouse_id &&
        created_at == other.created_at &&
        updated_at == other.updated_at &&
        deleted_at == other.deleted_at;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), name_section.hashCode),
                    warehouse_id.hashCode),
                created_at.hashCode),
            updated_at.hashCode),
        deleted_at.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Sections')
          ..add('id', id)
          ..add('name_section', name_section)
          ..add('warehouse_id', warehouse_id)
          ..add('created_at', created_at)
          ..add('updated_at', updated_at)
          ..add('deleted_at', deleted_at))
        .toString();
  }
}

class SectionsBuilder implements Builder<Sections, SectionsBuilder> {
  _$Sections? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name_section;
  String? get name_section => _$this._name_section;
  set name_section(String? name_section) => _$this._name_section = name_section;

  int? _warehouse_id;
  int? get warehouse_id => _$this._warehouse_id;
  set warehouse_id(int? warehouse_id) => _$this._warehouse_id = warehouse_id;

  String? _created_at;
  String? get created_at => _$this._created_at;
  set created_at(String? created_at) => _$this._created_at = created_at;

  String? _updated_at;
  String? get updated_at => _$this._updated_at;
  set updated_at(String? updated_at) => _$this._updated_at = updated_at;

  String? _deleted_at;
  String? get deleted_at => _$this._deleted_at;
  set deleted_at(String? deleted_at) => _$this._deleted_at = deleted_at;

  SectionsBuilder();

  SectionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name_section = $v.name_section;
      _warehouse_id = $v.warehouse_id;
      _created_at = $v.created_at;
      _updated_at = $v.updated_at;
      _deleted_at = $v.deleted_at;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Sections other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Sections;
  }

  @override
  void update(void Function(SectionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Sections build() {
    final _$result = _$v ??
        new _$Sections._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'Sections', 'id'),
            name_section: BuiltValueNullFieldError.checkNotNull(
                name_section, 'Sections', 'name_section'),
            warehouse_id: BuiltValueNullFieldError.checkNotNull(
                warehouse_id, 'Sections', 'warehouse_id'),
            created_at: BuiltValueNullFieldError.checkNotNull(
                created_at, 'Sections', 'created_at'),
            updated_at: BuiltValueNullFieldError.checkNotNull(
                updated_at, 'Sections', 'updated_at'),
            deleted_at: deleted_at);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
