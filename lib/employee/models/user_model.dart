import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/employee/models/employee_model.dart';
import 'package:erp_fronted/role/models/role_model.dart';
import 'package:erp_fronted/src/models/serializers.dart';
import 'package:built_collection/built_collection.dart';

part 'user_model.g.dart';

abstract class Users implements Built<Users, UsersBuilder> {
  static Serializer<Users> get serializer => _$usersSerializer;

  BuiltList<User> get users;

  Users._();
  factory Users([void Function(UsersBuilder) updates]) = _$Users;
}

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  int? get id;

  String get email;

  String? get password;

  @BuiltValueField(wireName: 'role_id')
  int? get roleId;

  @BuiltValueField(wireName: 'employee_id')
  int? get employeeId;

  Role? get role;

  Employee? get employee;

  User._();
  factory User([void Function(UserBuilder) updates]) = _$User;
}

User? parseUser(String userString) {
  final parsedUser = jsonDecode(userString);
  User? user = standardSerializers.deserializeWith(User.serializer, parsedUser);
  return user;
}