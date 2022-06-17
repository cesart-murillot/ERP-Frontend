// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Branches> _$branchesSerializer = new _$BranchesSerializer();
Serializer<Branch> _$branchSerializer = new _$BranchSerializer();

class _$BranchesSerializer implements StructuredSerializer<Branches> {
  @override
  final Iterable<Type> types = const [Branches, _$Branches];
  @override
  final String wireName = 'Branches';

  @override
  Iterable<Object?> serialize(Serializers serializers, Branches object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'branches',
      serializers.serialize(object.branches,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Branch)])),
    ];
    Object? value;
    value = object.links;
    if (value != null) {
      result
        ..add('links')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LinkData)));
    }
    value = object.meta;
    if (value != null) {
      result
        ..add('meta')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(MetaData)));
    }
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
        case 'branches':
          result.branches.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Branch)]))!
              as BuiltList<Object?>);
          break;
        case 'links':
          result.links.replace(serializers.deserialize(value,
              specifiedType: const FullType(LinkData))! as LinkData);
          break;
        case 'meta':
          result.meta.replace(serializers.deserialize(value,
              specifiedType: const FullType(MetaData))! as MetaData);
          break;
      }
    }

    return result.build();
  }
}

class _$BranchSerializer implements StructuredSerializer<Branch> {
  @override
  final Iterable<Type> types = const [Branch, _$Branch];
  @override
  final String wireName = 'Branch';

  @override
  Iterable<Object?> serialize(Serializers serializers, Branch object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'warehouses',
      serializers.serialize(object.warehouses,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Warehouse)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.nameBranch;
    if (value != null) {
      result
        ..add('name_branch')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.addressBranch;
    if (value != null) {
      result
        ..add('address_branch')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.typeBranch;
    if (value != null) {
      result
        ..add('type_branch')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Branch deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BranchBuilder();

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
        case 'name_branch':
          result.nameBranch = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'address_branch':
          result.addressBranch = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type_branch':
          result.typeBranch = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
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

class _$Branches extends Branches {
  @override
  final BuiltList<Branch> branches;
  @override
  final LinkData? links;
  @override
  final MetaData? meta;

  factory _$Branches([void Function(BranchesBuilder)? updates]) =>
      (new BranchesBuilder()..update(updates))._build();

  _$Branches._({required this.branches, this.links, this.meta}) : super._() {
    BuiltValueNullFieldError.checkNotNull(branches, 'Branches', 'branches');
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
        branches == other.branches &&
        links == other.links &&
        meta == other.meta;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, branches.hashCode), links.hashCode), meta.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Branches')
          ..add('branches', branches)
          ..add('links', links)
          ..add('meta', meta))
        .toString();
  }
}

class BranchesBuilder implements Builder<Branches, BranchesBuilder> {
  _$Branches? _$v;

  ListBuilder<Branch>? _branches;
  ListBuilder<Branch> get branches =>
      _$this._branches ??= new ListBuilder<Branch>();
  set branches(ListBuilder<Branch>? branches) => _$this._branches = branches;

  LinkDataBuilder? _links;
  LinkDataBuilder get links => _$this._links ??= new LinkDataBuilder();
  set links(LinkDataBuilder? links) => _$this._links = links;

  MetaDataBuilder? _meta;
  MetaDataBuilder get meta => _$this._meta ??= new MetaDataBuilder();
  set meta(MetaDataBuilder? meta) => _$this._meta = meta;

  BranchesBuilder();

  BranchesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _branches = $v.branches.toBuilder();
      _links = $v.links?.toBuilder();
      _meta = $v.meta?.toBuilder();
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
  Branches build() => _build();

  _$Branches _build() {
    _$Branches _$result;
    try {
      _$result = _$v ??
          new _$Branches._(
              branches: branches.build(),
              links: _links?.build(),
              meta: _meta?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'branches';
        branches.build();
        _$failedField = 'links';
        _links?.build();
        _$failedField = 'meta';
        _meta?.build();
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

class _$Branch extends Branch {
  @override
  final int? id;
  @override
  final String? nameBranch;
  @override
  final String? addressBranch;
  @override
  final String? typeBranch;
  @override
  final BuiltList<Warehouse> warehouses;

  factory _$Branch([void Function(BranchBuilder)? updates]) =>
      (new BranchBuilder()..update(updates))._build();

  _$Branch._(
      {this.id,
      this.nameBranch,
      this.addressBranch,
      this.typeBranch,
      required this.warehouses})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(warehouses, 'Branch', 'warehouses');
  }

  @override
  Branch rebuild(void Function(BranchBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BranchBuilder toBuilder() => new BranchBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Branch &&
        id == other.id &&
        nameBranch == other.nameBranch &&
        addressBranch == other.addressBranch &&
        typeBranch == other.typeBranch &&
        warehouses == other.warehouses;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), nameBranch.hashCode),
                addressBranch.hashCode),
            typeBranch.hashCode),
        warehouses.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Branch')
          ..add('id', id)
          ..add('nameBranch', nameBranch)
          ..add('addressBranch', addressBranch)
          ..add('typeBranch', typeBranch)
          ..add('warehouses', warehouses))
        .toString();
  }
}

class BranchBuilder implements Builder<Branch, BranchBuilder> {
  _$Branch? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _nameBranch;
  String? get nameBranch => _$this._nameBranch;
  set nameBranch(String? nameBranch) => _$this._nameBranch = nameBranch;

  String? _addressBranch;
  String? get addressBranch => _$this._addressBranch;
  set addressBranch(String? addressBranch) =>
      _$this._addressBranch = addressBranch;

  String? _typeBranch;
  String? get typeBranch => _$this._typeBranch;
  set typeBranch(String? typeBranch) => _$this._typeBranch = typeBranch;

  ListBuilder<Warehouse>? _warehouses;
  ListBuilder<Warehouse> get warehouses =>
      _$this._warehouses ??= new ListBuilder<Warehouse>();
  set warehouses(ListBuilder<Warehouse>? warehouses) =>
      _$this._warehouses = warehouses;

  BranchBuilder();

  BranchBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nameBranch = $v.nameBranch;
      _addressBranch = $v.addressBranch;
      _typeBranch = $v.typeBranch;
      _warehouses = $v.warehouses.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Branch other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Branch;
  }

  @override
  void update(void Function(BranchBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Branch build() => _build();

  _$Branch _build() {
    _$Branch _$result;
    try {
      _$result = _$v ??
          new _$Branch._(
              id: id,
              nameBranch: nameBranch,
              addressBranch: addressBranch,
              typeBranch: typeBranch,
              warehouses: warehouses.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'warehouses';
        warehouses.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Branch', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
