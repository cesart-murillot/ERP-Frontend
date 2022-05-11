import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/employee/models/user_model.dart';

part 'employee_model.g.dart';

abstract class Employee implements Built<Employee, EmployeeBuilder> {
  static Serializer<Employee> get serializer => _$employeeSerializer;

  int? get id;

  @BuiltValueField(wireName: 'names_employee')
  String get namesEmployee;

  @BuiltValueField(wireName: 'last_name_employee')
  String get lastNameEmployee;

  @BuiltValueField(wireName: 'CI_employee')
  String? get ciEmployee;

  @BuiltValueField(wireName: 'birth_date_employee')
  String get birthDateEmployee;

  User get user;

  Employee._();
  factory Employee([void Function(EmployeeBuilder) updates]) = _$Employee;
}