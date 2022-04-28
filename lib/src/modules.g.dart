// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modules.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Modules> _$modulesSerializer = new _$ModulesSerializer();
Serializer<Module> _$moduleSerializer = new _$ModuleSerializer();

class _$ModulesSerializer implements StructuredSerializer<Modules> {
  @override
  final Iterable<Type> types = const [Modules, _$Modules];
  @override
  final String wireName = 'Modules';

  @override
  Iterable<Object?> serialize(Serializers serializers, Modules object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'data',
      serializers.serialize(object.data,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Module)])),
      'links',
      serializers.serialize(object.links, specifiedType: const FullType(Links)),
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(Meta)),
    ];

    return result;
  }

  @override
  Modules deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ModulesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Module)]))!
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

class _$ModuleSerializer implements StructuredSerializer<Module> {
  @override
  final Iterable<Type> types = const [Module, _$Module];
  @override
  final String wireName = 'Module';

  @override
  Iterable<Object?> serialize(Serializers serializers, Module object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'module',
      serializers.serialize(object.module,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Module deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ModuleBuilder();

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
        case 'module':
          result.module = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Modules extends Modules {
  @override
  final BuiltList<Module> data;
  @override
  final Links links;
  @override
  final Meta meta;

  factory _$Modules([void Function(ModulesBuilder)? updates]) =>
      (new ModulesBuilder()..update(updates)).build();

  _$Modules._({required this.data, required this.links, required this.meta})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(data, 'Modules', 'data');
    BuiltValueNullFieldError.checkNotNull(links, 'Modules', 'links');
    BuiltValueNullFieldError.checkNotNull(meta, 'Modules', 'meta');
  }

  @override
  Modules rebuild(void Function(ModulesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModulesBuilder toBuilder() => new ModulesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Modules &&
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
    return (newBuiltValueToStringHelper('Modules')
          ..add('data', data)
          ..add('links', links)
          ..add('meta', meta))
        .toString();
  }
}

class ModulesBuilder implements Builder<Modules, ModulesBuilder> {
  _$Modules? _$v;

  ListBuilder<Module>? _data;
  ListBuilder<Module> get data => _$this._data ??= new ListBuilder<Module>();
  set data(ListBuilder<Module>? data) => _$this._data = data;

  LinksBuilder? _links;
  LinksBuilder get links => _$this._links ??= new LinksBuilder();
  set links(LinksBuilder? links) => _$this._links = links;

  MetaBuilder? _meta;
  MetaBuilder get meta => _$this._meta ??= new MetaBuilder();
  set meta(MetaBuilder? meta) => _$this._meta = meta;

  ModulesBuilder();

  ModulesBuilder get _$this {
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
  void replace(Modules other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Modules;
  }

  @override
  void update(void Function(ModulesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Modules build() {
    _$Modules _$result;
    try {
      _$result = _$v ??
          new _$Modules._(
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
            'Modules', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Module extends Module {
  @override
  final int id;
  @override
  final String module;

  factory _$Module([void Function(ModuleBuilder)? updates]) =>
      (new ModuleBuilder()..update(updates)).build();

  _$Module._({required this.id, required this.module}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Module', 'id');
    BuiltValueNullFieldError.checkNotNull(module, 'Module', 'module');
  }

  @override
  Module rebuild(void Function(ModuleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModuleBuilder toBuilder() => new ModuleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Module && id == other.id && module == other.module;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), module.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Module')
          ..add('id', id)
          ..add('module', module))
        .toString();
  }
}

class ModuleBuilder implements Builder<Module, ModuleBuilder> {
  _$Module? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _module;
  String? get module => _$this._module;
  set module(String? module) => _$this._module = module;

  ModuleBuilder();

  ModuleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _module = $v.module;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Module other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Module;
  }

  @override
  void update(void Function(ModuleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Module build() {
    final _$result = _$v ??
        new _$Module._(
            id: BuiltValueNullFieldError.checkNotNull(id, 'Module', 'id'),
            module: BuiltValueNullFieldError.checkNotNull(
                module, 'Module', 'module'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
