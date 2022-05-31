// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Roles> _$rolesSerializer = new _$RolesSerializer();
Serializer<Role> _$roleSerializer = new _$RoleSerializer();

class _$RolesSerializer implements StructuredSerializer<Roles> {
  @override
  final Iterable<Type> types = const [Roles, _$Roles];
  @override
  final String wireName = 'Roles';

  @override
  Iterable<Object?> serialize(Serializers serializers, Roles object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'roles',
      serializers.serialize(object.roles,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Role)])),
    ];

    return result;
  }

  @override
  Roles deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RolesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'roles':
          result.roles.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Role)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$RoleSerializer implements StructuredSerializer<Role> {
  @override
  final Iterable<Type> types = const [Role, _$Role];
  @override
  final String wireName = 'Role';

  @override
  Iterable<Object?> serialize(Serializers serializers, Role object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name_role',
      serializers.serialize(object.nameRole,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.descriptionRole;
    if (value != null) {
      result
        ..add('description_role')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.modules;
    if (value != null) {
      result
        ..add('modules')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Module)])));
    }
    return result;
  }

  @override
  Role deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoleBuilder();

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
        case 'name_role':
          result.nameRole = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description_role':
          result.descriptionRole = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
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

class _$Roles extends Roles {
  @override
  final BuiltList<Role> roles;

  factory _$Roles([void Function(RolesBuilder)? updates]) =>
      (new RolesBuilder()..update(updates))._build();

  _$Roles._({required this.roles}) : super._() {
    BuiltValueNullFieldError.checkNotNull(roles, 'Roles', 'roles');
  }

  @override
  Roles rebuild(void Function(RolesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RolesBuilder toBuilder() => new RolesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Roles && roles == other.roles;
  }

  @override
  int get hashCode {
    return $jf($jc(0, roles.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Roles')..add('roles', roles))
        .toString();
  }
}

class RolesBuilder implements Builder<Roles, RolesBuilder> {
  _$Roles? _$v;

  ListBuilder<Role>? _roles;
  ListBuilder<Role> get roles => _$this._roles ??= new ListBuilder<Role>();
  set roles(ListBuilder<Role>? roles) => _$this._roles = roles;

  RolesBuilder();

  RolesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _roles = $v.roles.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Roles other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Roles;
  }

  @override
  void update(void Function(RolesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Roles build() => _build();

  _$Roles _build() {
    _$Roles _$result;
    try {
      _$result = _$v ?? new _$Roles._(roles: roles.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roles';
        roles.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Roles', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Role extends Role {
  @override
  final int? id;
  @override
  final String nameRole;
  @override
  final String? descriptionRole;
  @override
  final BuiltList<Module>? modules;

  factory _$Role([void Function(RoleBuilder)? updates]) =>
      (new RoleBuilder()..update(updates))._build();

  _$Role._(
      {this.id, required this.nameRole, this.descriptionRole, this.modules})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(nameRole, 'Role', 'nameRole');
  }

  @override
  Role rebuild(void Function(RoleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoleBuilder toBuilder() => new RoleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Role &&
        id == other.id &&
        nameRole == other.nameRole &&
        descriptionRole == other.descriptionRole &&
        modules == other.modules;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), nameRole.hashCode),
            descriptionRole.hashCode),
        modules.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Role')
          ..add('id', id)
          ..add('nameRole', nameRole)
          ..add('descriptionRole', descriptionRole)
          ..add('modules', modules))
        .toString();
  }
}

class RoleBuilder implements Builder<Role, RoleBuilder> {
  _$Role? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _nameRole;
  String? get nameRole => _$this._nameRole;
  set nameRole(String? nameRole) => _$this._nameRole = nameRole;

  String? _descriptionRole;
  String? get descriptionRole => _$this._descriptionRole;
  set descriptionRole(String? descriptionRole) =>
      _$this._descriptionRole = descriptionRole;

  ListBuilder<Module>? _modules;
  ListBuilder<Module> get modules =>
      _$this._modules ??= new ListBuilder<Module>();
  set modules(ListBuilder<Module>? modules) => _$this._modules = modules;

  RoleBuilder();

  RoleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nameRole = $v.nameRole;
      _descriptionRole = $v.descriptionRole;
      _modules = $v.modules?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Role other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Role;
  }

  @override
  void update(void Function(RoleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Role build() => _build();

  _$Role _build() {
    _$Role _$result;
    try {
      _$result = _$v ??
          new _$Role._(
              id: id,
              nameRole: BuiltValueNullFieldError.checkNotNull(
                  nameRole, 'Role', 'nameRole'),
              descriptionRole: descriptionRole,
              modules: _modules?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'modules';
        _modules?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Role', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
