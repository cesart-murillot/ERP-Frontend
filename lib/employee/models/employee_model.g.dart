// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Employee> _$employeeSerializer = new _$EmployeeSerializer();

class _$EmployeeSerializer implements StructuredSerializer<Employee> {
  @override
  final Iterable<Type> types = const [Employee, _$Employee];
  @override
  final String wireName = 'Employee';

  @override
  Iterable<Object?> serialize(Serializers serializers, Employee object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'names_employee',
      serializers.serialize(object.namesEmployee,
          specifiedType: const FullType(String)),
      'last_name_employee',
      serializers.serialize(object.lastNameEmployee,
          specifiedType: const FullType(String)),
      'birth_date_employee',
      serializers.serialize(object.birthDateEmployee,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(User)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ciEmployee;
    if (value != null) {
      result
        ..add('CI_employee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Employee deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EmployeeBuilder();

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
        case 'names_employee':
          result.namesEmployee = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'last_name_employee':
          result.lastNameEmployee = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'CI_employee':
          result.ciEmployee = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'birth_date_employee':
          result.birthDateEmployee = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
      }
    }

    return result.build();
  }
}

class _$Employee extends Employee {
  @override
  final int? id;
  @override
  final String namesEmployee;
  @override
  final String lastNameEmployee;
  @override
  final String? ciEmployee;
  @override
  final String birthDateEmployee;
  @override
  final User user;

  factory _$Employee([void Function(EmployeeBuilder)? updates]) =>
      (new EmployeeBuilder()..update(updates))._build();

  _$Employee._(
      {this.id,
      required this.namesEmployee,
      required this.lastNameEmployee,
      this.ciEmployee,
      required this.birthDateEmployee,
      required this.user})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        namesEmployee, 'Employee', 'namesEmployee');
    BuiltValueNullFieldError.checkNotNull(
        lastNameEmployee, 'Employee', 'lastNameEmployee');
    BuiltValueNullFieldError.checkNotNull(
        birthDateEmployee, 'Employee', 'birthDateEmployee');
    BuiltValueNullFieldError.checkNotNull(user, 'Employee', 'user');
  }

  @override
  Employee rebuild(void Function(EmployeeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmployeeBuilder toBuilder() => new EmployeeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Employee &&
        id == other.id &&
        namesEmployee == other.namesEmployee &&
        lastNameEmployee == other.lastNameEmployee &&
        ciEmployee == other.ciEmployee &&
        birthDateEmployee == other.birthDateEmployee &&
        user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), namesEmployee.hashCode),
                    lastNameEmployee.hashCode),
                ciEmployee.hashCode),
            birthDateEmployee.hashCode),
        user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Employee')
          ..add('id', id)
          ..add('namesEmployee', namesEmployee)
          ..add('lastNameEmployee', lastNameEmployee)
          ..add('ciEmployee', ciEmployee)
          ..add('birthDateEmployee', birthDateEmployee)
          ..add('user', user))
        .toString();
  }
}

class EmployeeBuilder implements Builder<Employee, EmployeeBuilder> {
  _$Employee? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _namesEmployee;
  String? get namesEmployee => _$this._namesEmployee;
  set namesEmployee(String? namesEmployee) =>
      _$this._namesEmployee = namesEmployee;

  String? _lastNameEmployee;
  String? get lastNameEmployee => _$this._lastNameEmployee;
  set lastNameEmployee(String? lastNameEmployee) =>
      _$this._lastNameEmployee = lastNameEmployee;

  String? _ciEmployee;
  String? get ciEmployee => _$this._ciEmployee;
  set ciEmployee(String? ciEmployee) => _$this._ciEmployee = ciEmployee;

  String? _birthDateEmployee;
  String? get birthDateEmployee => _$this._birthDateEmployee;
  set birthDateEmployee(String? birthDateEmployee) =>
      _$this._birthDateEmployee = birthDateEmployee;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  EmployeeBuilder();

  EmployeeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _namesEmployee = $v.namesEmployee;
      _lastNameEmployee = $v.lastNameEmployee;
      _ciEmployee = $v.ciEmployee;
      _birthDateEmployee = $v.birthDateEmployee;
      _user = $v.user.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Employee other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Employee;
  }

  @override
  void update(void Function(EmployeeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Employee build() => _build();

  _$Employee _build() {
    _$Employee _$result;
    try {
      _$result = _$v ??
          new _$Employee._(
              id: id,
              namesEmployee: BuiltValueNullFieldError.checkNotNull(
                  namesEmployee, 'Employee', 'namesEmployee'),
              lastNameEmployee: BuiltValueNullFieldError.checkNotNull(
                  lastNameEmployee, 'Employee', 'lastNameEmployee'),
              ciEmployee: ciEmployee,
              birthDateEmployee: BuiltValueNullFieldError.checkNotNull(
                  birthDateEmployee, 'Employee', 'birthDateEmployee'),
              user: user.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Employee', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
