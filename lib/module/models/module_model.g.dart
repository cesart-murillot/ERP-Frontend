// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_model.dart';

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
      'modules',
      serializers.serialize(object.modules,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Module)])),
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
        case 'modules':
          result.modules.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Module)]))!
              as BuiltList<Object?>);
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
      'name_module',
      serializers.serialize(object.nameModule,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.iconModule;
    if (value != null) {
      result
        ..add('icon_module')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.routeModule;
    if (value != null) {
      result
        ..add('route_module')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
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
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name_module':
          result.nameModule = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'icon_module':
          result.iconModule = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'route_module':
          result.routeModule = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Modules extends Modules {
  @override
  final BuiltList<Module> modules;

  factory _$Modules([void Function(ModulesBuilder)? updates]) =>
      (new ModulesBuilder()..update(updates))._build();

  _$Modules._({required this.modules}) : super._() {
    BuiltValueNullFieldError.checkNotNull(modules, 'Modules', 'modules');
  }

  @override
  Modules rebuild(void Function(ModulesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModulesBuilder toBuilder() => new ModulesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Modules && modules == other.modules;
  }

  @override
  int get hashCode {
    return $jf($jc(0, modules.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Modules')..add('modules', modules))
        .toString();
  }
}

class ModulesBuilder implements Builder<Modules, ModulesBuilder> {
  _$Modules? _$v;

  ListBuilder<Module>? _modules;
  ListBuilder<Module> get modules =>
      _$this._modules ??= new ListBuilder<Module>();
  set modules(ListBuilder<Module>? modules) => _$this._modules = modules;

  ModulesBuilder();

  ModulesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _modules = $v.modules.toBuilder();
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
  Modules build() => _build();

  _$Modules _build() {
    _$Modules _$result;
    try {
      _$result = _$v ?? new _$Modules._(modules: modules.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'modules';
        modules.build();
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
  final int? id;
  @override
  final String nameModule;
  @override
  final String? iconModule;
  @override
  final String? routeModule;

  factory _$Module([void Function(ModuleBuilder)? updates]) =>
      (new ModuleBuilder()..update(updates))._build();

  _$Module._(
      {this.id, required this.nameModule, this.iconModule, this.routeModule})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(nameModule, 'Module', 'nameModule');
  }

  @override
  Module rebuild(void Function(ModuleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ModuleBuilder toBuilder() => new ModuleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Module &&
        id == other.id &&
        nameModule == other.nameModule &&
        iconModule == other.iconModule &&
        routeModule == other.routeModule;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), nameModule.hashCode), iconModule.hashCode),
        routeModule.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Module')
          ..add('id', id)
          ..add('nameModule', nameModule)
          ..add('iconModule', iconModule)
          ..add('routeModule', routeModule))
        .toString();
  }
}

class ModuleBuilder implements Builder<Module, ModuleBuilder> {
  _$Module? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _nameModule;
  String? get nameModule => _$this._nameModule;
  set nameModule(String? nameModule) => _$this._nameModule = nameModule;

  String? _iconModule;
  String? get iconModule => _$this._iconModule;
  set iconModule(String? iconModule) => _$this._iconModule = iconModule;

  String? _routeModule;
  String? get routeModule => _$this._routeModule;
  set routeModule(String? routeModule) => _$this._routeModule = routeModule;

  ModuleBuilder();

  ModuleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nameModule = $v.nameModule;
      _iconModule = $v.iconModule;
      _routeModule = $v.routeModule;
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
  Module build() => _build();

  _$Module _build() {
    final _$result = _$v ??
        new _$Module._(
            id: id,
            nameModule: BuiltValueNullFieldError.checkNotNull(
                nameModule, 'Module', 'nameModule'),
            iconModule: iconModule,
            routeModule: routeModule);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
