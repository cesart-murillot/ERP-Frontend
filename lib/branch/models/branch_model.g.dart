// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Branch> _$branchSerializer = new _$BranchSerializer();

class _$BranchSerializer implements StructuredSerializer<Branch> {
  @override
  final Iterable<Type> types = const [Branch, _$Branch];
  @override
  final String wireName = 'Branch';

  @override
  Iterable<Object?> serialize(Serializers serializers, Branch object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name_branch',
      serializers.serialize(object.nameBranch,
          specifiedType: const FullType(String)),
      'address_branch',
      serializers.serialize(object.addressBranch,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
              specifiedType: const FullType(String))! as String;
          break;
        case 'address_branch':
          result.addressBranch = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Branch extends Branch {
  @override
  final int? id;
  @override
  final String nameBranch;
  @override
  final String addressBranch;

  factory _$Branch([void Function(BranchBuilder)? updates]) =>
      (new BranchBuilder()..update(updates)).build();

  _$Branch._({this.id, required this.nameBranch, required this.addressBranch})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(nameBranch, 'Branch', 'nameBranch');
    BuiltValueNullFieldError.checkNotNull(
        addressBranch, 'Branch', 'addressBranch');
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
        addressBranch == other.addressBranch;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, id.hashCode), nameBranch.hashCode), addressBranch.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Branch')
          ..add('id', id)
          ..add('nameBranch', nameBranch)
          ..add('addressBranch', addressBranch))
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

  BranchBuilder();

  BranchBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nameBranch = $v.nameBranch;
      _addressBranch = $v.addressBranch;
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
  _$Branch build() {
    final _$result = _$v ??
        new _$Branch._(
            id: id,
            nameBranch: BuiltValueNullFieldError.checkNotNull(
                nameBranch, 'Branch', 'nameBranch'),
            addressBranch: BuiltValueNullFieldError.checkNotNull(
                addressBranch, 'Branch', 'addressBranch'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
