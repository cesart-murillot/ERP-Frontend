// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Employees> _$employeesSerializer = new _$EmployeesSerializer();
Serializer<Employee> _$employeeSerializer = new _$EmployeeSerializer();

class _$EmployeesSerializer implements StructuredSerializer<Employees> {
  @override
  final Iterable<Type> types = const [Employees, _$Employees];
  @override
  final String wireName = 'Employees';

  @override
  Iterable<Object?> serialize(Serializers serializers, Employees object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'employees',
      serializers.serialize(object.employees,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Employee)])),
    ];

    return result;
  }

  @override
  Employees deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EmployeesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'employees':
          result.employees.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Employee)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

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
    value = object.birthDateEmployee;
    if (value != null) {
      result
        ..add('birth_date_employee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.branchID;
    if (value != null) {
      result
        ..add('branch_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(User)));
    }
    value = object.branch;
    if (value != null) {
      result
        ..add('branch')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Branch)));
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
              specifiedType: const FullType(String)) as String?;
          break;
        case 'branch_id':
          result.branchID = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User))! as User);
          break;
        case 'branch':
          result.branch.replace(serializers.deserialize(value,
              specifiedType: const FullType(Branch))! as Branch);
          break;
      }
    }

    return result.build();
  }
}

class _$Employees extends Employees {
  @override
  final BuiltList<Employee> employees;

  factory _$Employees([void Function(EmployeesBuilder)? updates]) =>
      (new EmployeesBuilder()..update(updates))._build();

  _$Employees._({required this.employees}) : super._() {
    BuiltValueNullFieldError.checkNotNull(employees, 'Employees', 'employees');
  }

  @override
  Employees rebuild(void Function(EmployeesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmployeesBuilder toBuilder() => new EmployeesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Employees && employees == other.employees;
  }

  @override
  int get hashCode {
    return $jf($jc(0, employees.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Employees')
          ..add('employees', employees))
        .toString();
  }
}

class EmployeesBuilder implements Builder<Employees, EmployeesBuilder> {
  _$Employees? _$v;

  ListBuilder<Employee>? _employees;
  ListBuilder<Employee> get employees =>
      _$this._employees ??= new ListBuilder<Employee>();
  set employees(ListBuilder<Employee>? employees) =>
      _$this._employees = employees;

  EmployeesBuilder();

  EmployeesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _employees = $v.employees.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Employees other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Employees;
  }

  @override
  void update(void Function(EmployeesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Employees build() => _build();

  _$Employees _build() {
    _$Employees _$result;
    try {
      _$result = _$v ?? new _$Employees._(employees: employees.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'employees';
        employees.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Employees', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
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
  final String? birthDateEmployee;
  @override
  final int? branchID;
  @override
  final User? user;
  @override
  final Branch? branch;

  factory _$Employee([void Function(EmployeeBuilder)? updates]) =>
      (new EmployeeBuilder()..update(updates))._build();

  _$Employee._(
      {this.id,
      required this.namesEmployee,
      required this.lastNameEmployee,
      this.ciEmployee,
      this.birthDateEmployee,
      this.branchID,
      this.user,
      this.branch})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        namesEmployee, 'Employee', 'namesEmployee');
    BuiltValueNullFieldError.checkNotNull(
        lastNameEmployee, 'Employee', 'lastNameEmployee');
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
        branchID == other.branchID &&
        user == other.user &&
        branch == other.branch;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), namesEmployee.hashCode),
                            lastNameEmployee.hashCode),
                        ciEmployee.hashCode),
                    birthDateEmployee.hashCode),
                branchID.hashCode),
            user.hashCode),
        branch.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Employee')
          ..add('id', id)
          ..add('namesEmployee', namesEmployee)
          ..add('lastNameEmployee', lastNameEmployee)
          ..add('ciEmployee', ciEmployee)
          ..add('birthDateEmployee', birthDateEmployee)
          ..add('branchID', branchID)
          ..add('user', user)
          ..add('branch', branch))
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

  int? _branchID;
  int? get branchID => _$this._branchID;
  set branchID(int? branchID) => _$this._branchID = branchID;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  BranchBuilder? _branch;
  BranchBuilder get branch => _$this._branch ??= new BranchBuilder();
  set branch(BranchBuilder? branch) => _$this._branch = branch;

  EmployeeBuilder();

  EmployeeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _namesEmployee = $v.namesEmployee;
      _lastNameEmployee = $v.lastNameEmployee;
      _ciEmployee = $v.ciEmployee;
      _birthDateEmployee = $v.birthDateEmployee;
      _branchID = $v.branchID;
      _user = $v.user?.toBuilder();
      _branch = $v.branch?.toBuilder();
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
              birthDateEmployee: birthDateEmployee,
              branchID: branchID,
              user: _user?.build(),
              branch: _branch?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'branch';
        _branch?.build();
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
