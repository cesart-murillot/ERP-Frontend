import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'role_model.g.dart';

abstract class Roles implements Built<Roles, RolesBuilder> {
  static Serializer<Roles> get serializer => _$rolesSerializer;

  BuiltList<Role> get roles;

  Roles._();
  factory Roles([void Function(RolesBuilder) updates]) = _$Roles;
}

abstract class Role implements Built<Role, RoleBuilder> {
  static Serializer<Role> get serializer => _$roleSerializer;

  int? get id;

  @BuiltValueField(wireName: 'name_role')
  String get nameRole;

  @BuiltValueField(wireName: 'description_role')
  String? get descriptionRole;

  Role._();
  factory Role([void Function(RoleBuilder) updates]) = _$Role;
}