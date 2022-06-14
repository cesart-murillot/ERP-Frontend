// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Section> _$sectionSerializer = new _$SectionSerializer();

class _$SectionSerializer implements StructuredSerializer<Section> {
  @override
  final Iterable<Type> types = const [Section, _$Section];
  @override
  final String wireName = 'Section';

  @override
  Iterable<Object?> serialize(Serializers serializers, Section object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name_section',
      serializers.serialize(object.nameSection,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.warehouse;
    if (value != null) {
      result
        ..add('warehouse')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Warehouse)));
    }
    return result;
  }

  @override
  Section deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SectionBuilder();

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
          result.nameSection = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'warehouse':
          result.warehouse.replace(serializers.deserialize(value,
              specifiedType: const FullType(Warehouse))! as Warehouse);
          break;
      }
    }

    return result.build();
  }
}

class _$Section extends Section {
  @override
  final int id;
  @override
  final String nameSection;
  @override
  final Warehouse? warehouse;

  factory _$Section([void Function(SectionBuilder)? updates]) =>
      (new SectionBuilder()..update(updates))._build();

  _$Section._({required this.id, required this.nameSection, this.warehouse})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Section', 'id');
    BuiltValueNullFieldError.checkNotNull(
        nameSection, 'Section', 'nameSection');
  }

  @override
  Section rebuild(void Function(SectionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SectionBuilder toBuilder() => new SectionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Section &&
        id == other.id &&
        nameSection == other.nameSection &&
        warehouse == other.warehouse;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, id.hashCode), nameSection.hashCode), warehouse.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Section')
          ..add('id', id)
          ..add('nameSection', nameSection)
          ..add('warehouse', warehouse))
        .toString();
  }
}

class SectionBuilder implements Builder<Section, SectionBuilder> {
  _$Section? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _nameSection;
  String? get nameSection => _$this._nameSection;
  set nameSection(String? nameSection) => _$this._nameSection = nameSection;

  WarehouseBuilder? _warehouse;
  WarehouseBuilder get warehouse =>
      _$this._warehouse ??= new WarehouseBuilder();
  set warehouse(WarehouseBuilder? warehouse) => _$this._warehouse = warehouse;

  SectionBuilder();

  SectionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nameSection = $v.nameSection;
      _warehouse = $v.warehouse?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Section other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Section;
  }

  @override
  void update(void Function(SectionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Section build() => _build();

  _$Section _build() {
    _$Section _$result;
    try {
      _$result = _$v ??
          new _$Section._(
              id: BuiltValueNullFieldError.checkNotNull(id, 'Section', 'id'),
              nameSection: BuiltValueNullFieldError.checkNotNull(
                  nameSection, 'Section', 'nameSection'),
              warehouse: _warehouse?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'warehouse';
        _warehouse?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Section', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
