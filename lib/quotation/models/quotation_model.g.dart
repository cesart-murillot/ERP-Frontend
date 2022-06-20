// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotation_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Quotations> _$quotationsSerializer = new _$QuotationsSerializer();
Serializer<Quotation> _$quotationSerializer = new _$QuotationSerializer();
Serializer<ProductQuotation> _$productQuotationSerializer =
    new _$ProductQuotationSerializer();

class _$QuotationsSerializer implements StructuredSerializer<Quotations> {
  @override
  final Iterable<Type> types = const [Quotations, _$Quotations];
  @override
  final String wireName = 'Quotations';

  @override
  Iterable<Object?> serialize(Serializers serializers, Quotations object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'quotations',
      serializers.serialize(object.quotations,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Quotation)])),
    ];

    return result;
  }

  @override
  Quotations deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuotationsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'quotations':
          result.quotations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Quotation)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$QuotationSerializer implements StructuredSerializer<Quotation> {
  @override
  final Iterable<Type> types = const [Quotation, _$Quotation];
  @override
  final String wireName = 'Quotation';

  @override
  Iterable<Object?> serialize(Serializers serializers, Quotation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name_quotation',
      serializers.serialize(object.nameQuotation,
          specifiedType: const FullType(String)),
      'price_quotation',
      serializers.serialize(object.priceQuotation,
          specifiedType: const FullType(double)),
      'date_quotation',
      serializers.serialize(object.dateQuotation,
          specifiedType: const FullType(String)),
      'expiration_date',
      serializers.serialize(object.expirationDate,
          specifiedType: const FullType(String)),
      'user_id',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'branch_id',
      serializers.serialize(object.branchId,
          specifiedType: const FullType(int)),
      'product_quotations',
      serializers.serialize(object.productQuotations,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ProductQuotation)])),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
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
  Quotation deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new QuotationBuilder();

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
        case 'name_quotation':
          result.nameQuotation = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'price_quotation':
          result.priceQuotation = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'date_quotation':
          result.dateQuotation = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'expiration_date':
          result.expirationDate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'branch_id':
          result.branchId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'product_quotations':
          result.productQuotations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductQuotation)]))!
              as BuiltList<Object?>);
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

class _$ProductQuotationSerializer
    implements StructuredSerializer<ProductQuotation> {
  @override
  final Iterable<Type> types = const [ProductQuotation, _$ProductQuotation];
  @override
  final String wireName = 'ProductQuotation';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductQuotation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(int)),
      'unit_price',
      serializers.serialize(object.unitPrice,
          specifiedType: const FullType(double)),
      'total_price',
      serializers.serialize(object.totalPrice,
          specifiedType: const FullType(double)),
      'quotation_id',
      serializers.serialize(object.quotationId,
          specifiedType: const FullType(int)),
      'product_id',
      serializers.serialize(object.productId,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.product;
    if (value != null) {
      result
        ..add('product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Product)));
    }
    return result;
  }

  @override
  ProductQuotation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductQuotationBuilder();

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
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'unit_price':
          result.unitPrice = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'total_price':
          result.totalPrice = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'quotation_id':
          result.quotationId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'product_id':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'product':
          result.product.replace(serializers.deserialize(value,
              specifiedType: const FullType(Product))! as Product);
          break;
      }
    }

    return result.build();
  }
}

class _$Quotations extends Quotations {
  @override
  final BuiltList<Quotation> quotations;

  factory _$Quotations([void Function(QuotationsBuilder)? updates]) =>
      (new QuotationsBuilder()..update(updates))._build();

  _$Quotations._({required this.quotations}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        quotations, 'Quotations', 'quotations');
  }

  @override
  Quotations rebuild(void Function(QuotationsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuotationsBuilder toBuilder() => new QuotationsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Quotations && quotations == other.quotations;
  }

  @override
  int get hashCode {
    return $jf($jc(0, quotations.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Quotations')
          ..add('quotations', quotations))
        .toString();
  }
}

class QuotationsBuilder implements Builder<Quotations, QuotationsBuilder> {
  _$Quotations? _$v;

  ListBuilder<Quotation>? _quotations;
  ListBuilder<Quotation> get quotations =>
      _$this._quotations ??= new ListBuilder<Quotation>();
  set quotations(ListBuilder<Quotation>? quotations) =>
      _$this._quotations = quotations;

  QuotationsBuilder();

  QuotationsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quotations = $v.quotations.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Quotations other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Quotations;
  }

  @override
  void update(void Function(QuotationsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Quotations build() => _build();

  _$Quotations _build() {
    _$Quotations _$result;
    try {
      _$result = _$v ?? new _$Quotations._(quotations: quotations.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'quotations';
        quotations.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Quotations', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Quotation extends Quotation {
  @override
  final int? id;
  @override
  final String nameQuotation;
  @override
  final double priceQuotation;
  @override
  final String dateQuotation;
  @override
  final String expirationDate;
  @override
  final int userId;
  @override
  final int branchId;
  @override
  final BuiltList<ProductQuotation> productQuotations;
  @override
  final User? user;
  @override
  final Branch? branch;

  factory _$Quotation([void Function(QuotationBuilder)? updates]) =>
      (new QuotationBuilder()..update(updates))._build();

  _$Quotation._(
      {this.id,
      required this.nameQuotation,
      required this.priceQuotation,
      required this.dateQuotation,
      required this.expirationDate,
      required this.userId,
      required this.branchId,
      required this.productQuotations,
      this.user,
      this.branch})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        nameQuotation, 'Quotation', 'nameQuotation');
    BuiltValueNullFieldError.checkNotNull(
        priceQuotation, 'Quotation', 'priceQuotation');
    BuiltValueNullFieldError.checkNotNull(
        dateQuotation, 'Quotation', 'dateQuotation');
    BuiltValueNullFieldError.checkNotNull(
        expirationDate, 'Quotation', 'expirationDate');
    BuiltValueNullFieldError.checkNotNull(userId, 'Quotation', 'userId');
    BuiltValueNullFieldError.checkNotNull(branchId, 'Quotation', 'branchId');
    BuiltValueNullFieldError.checkNotNull(
        productQuotations, 'Quotation', 'productQuotations');
  }

  @override
  Quotation rebuild(void Function(QuotationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuotationBuilder toBuilder() => new QuotationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Quotation &&
        id == other.id &&
        nameQuotation == other.nameQuotation &&
        priceQuotation == other.priceQuotation &&
        dateQuotation == other.dateQuotation &&
        expirationDate == other.expirationDate &&
        userId == other.userId &&
        branchId == other.branchId &&
        productQuotations == other.productQuotations &&
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
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, id.hashCode),
                                        nameQuotation.hashCode),
                                    priceQuotation.hashCode),
                                dateQuotation.hashCode),
                            expirationDate.hashCode),
                        userId.hashCode),
                    branchId.hashCode),
                productQuotations.hashCode),
            user.hashCode),
        branch.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Quotation')
          ..add('id', id)
          ..add('nameQuotation', nameQuotation)
          ..add('priceQuotation', priceQuotation)
          ..add('dateQuotation', dateQuotation)
          ..add('expirationDate', expirationDate)
          ..add('userId', userId)
          ..add('branchId', branchId)
          ..add('productQuotations', productQuotations)
          ..add('user', user)
          ..add('branch', branch))
        .toString();
  }
}

class QuotationBuilder implements Builder<Quotation, QuotationBuilder> {
  _$Quotation? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _nameQuotation;
  String? get nameQuotation => _$this._nameQuotation;
  set nameQuotation(String? nameQuotation) =>
      _$this._nameQuotation = nameQuotation;

  double? _priceQuotation;
  double? get priceQuotation => _$this._priceQuotation;
  set priceQuotation(double? priceQuotation) =>
      _$this._priceQuotation = priceQuotation;

  String? _dateQuotation;
  String? get dateQuotation => _$this._dateQuotation;
  set dateQuotation(String? dateQuotation) =>
      _$this._dateQuotation = dateQuotation;

  String? _expirationDate;
  String? get expirationDate => _$this._expirationDate;
  set expirationDate(String? expirationDate) =>
      _$this._expirationDate = expirationDate;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  int? _branchId;
  int? get branchId => _$this._branchId;
  set branchId(int? branchId) => _$this._branchId = branchId;

  ListBuilder<ProductQuotation>? _productQuotations;
  ListBuilder<ProductQuotation> get productQuotations =>
      _$this._productQuotations ??= new ListBuilder<ProductQuotation>();
  set productQuotations(ListBuilder<ProductQuotation>? productQuotations) =>
      _$this._productQuotations = productQuotations;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  BranchBuilder? _branch;
  BranchBuilder get branch => _$this._branch ??= new BranchBuilder();
  set branch(BranchBuilder? branch) => _$this._branch = branch;

  QuotationBuilder();

  QuotationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nameQuotation = $v.nameQuotation;
      _priceQuotation = $v.priceQuotation;
      _dateQuotation = $v.dateQuotation;
      _expirationDate = $v.expirationDate;
      _userId = $v.userId;
      _branchId = $v.branchId;
      _productQuotations = $v.productQuotations.toBuilder();
      _user = $v.user?.toBuilder();
      _branch = $v.branch?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Quotation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Quotation;
  }

  @override
  void update(void Function(QuotationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Quotation build() => _build();

  _$Quotation _build() {
    _$Quotation _$result;
    try {
      _$result = _$v ??
          new _$Quotation._(
              id: id,
              nameQuotation: BuiltValueNullFieldError.checkNotNull(
                  nameQuotation, 'Quotation', 'nameQuotation'),
              priceQuotation: BuiltValueNullFieldError.checkNotNull(
                  priceQuotation, 'Quotation', 'priceQuotation'),
              dateQuotation: BuiltValueNullFieldError.checkNotNull(
                  dateQuotation, 'Quotation', 'dateQuotation'),
              expirationDate: BuiltValueNullFieldError.checkNotNull(
                  expirationDate, 'Quotation', 'expirationDate'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, 'Quotation', 'userId'),
              branchId: BuiltValueNullFieldError.checkNotNull(
                  branchId, 'Quotation', 'branchId'),
              productQuotations: productQuotations.build(),
              user: _user?.build(),
              branch: _branch?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'productQuotations';
        productQuotations.build();
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'branch';
        _branch?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Quotation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ProductQuotation extends ProductQuotation {
  @override
  final int? id;
  @override
  final int quantity;
  @override
  final double unitPrice;
  @override
  final double totalPrice;
  @override
  final int quotationId;
  @override
  final int productId;
  @override
  final Product? product;

  factory _$ProductQuotation(
          [void Function(ProductQuotationBuilder)? updates]) =>
      (new ProductQuotationBuilder()..update(updates))._build();

  _$ProductQuotation._(
      {this.id,
      required this.quantity,
      required this.unitPrice,
      required this.totalPrice,
      required this.quotationId,
      required this.productId,
      this.product})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        quantity, 'ProductQuotation', 'quantity');
    BuiltValueNullFieldError.checkNotNull(
        unitPrice, 'ProductQuotation', 'unitPrice');
    BuiltValueNullFieldError.checkNotNull(
        totalPrice, 'ProductQuotation', 'totalPrice');
    BuiltValueNullFieldError.checkNotNull(
        quotationId, 'ProductQuotation', 'quotationId');
    BuiltValueNullFieldError.checkNotNull(
        productId, 'ProductQuotation', 'productId');
  }

  @override
  ProductQuotation rebuild(void Function(ProductQuotationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductQuotationBuilder toBuilder() =>
      new ProductQuotationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductQuotation &&
        id == other.id &&
        quantity == other.quantity &&
        unitPrice == other.unitPrice &&
        totalPrice == other.totalPrice &&
        quotationId == other.quotationId &&
        productId == other.productId &&
        product == other.product;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), quantity.hashCode),
                        unitPrice.hashCode),
                    totalPrice.hashCode),
                quotationId.hashCode),
            productId.hashCode),
        product.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductQuotation')
          ..add('id', id)
          ..add('quantity', quantity)
          ..add('unitPrice', unitPrice)
          ..add('totalPrice', totalPrice)
          ..add('quotationId', quotationId)
          ..add('productId', productId)
          ..add('product', product))
        .toString();
  }
}

class ProductQuotationBuilder
    implements Builder<ProductQuotation, ProductQuotationBuilder> {
  _$ProductQuotation? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  double? _unitPrice;
  double? get unitPrice => _$this._unitPrice;
  set unitPrice(double? unitPrice) => _$this._unitPrice = unitPrice;

  double? _totalPrice;
  double? get totalPrice => _$this._totalPrice;
  set totalPrice(double? totalPrice) => _$this._totalPrice = totalPrice;

  int? _quotationId;
  int? get quotationId => _$this._quotationId;
  set quotationId(int? quotationId) => _$this._quotationId = quotationId;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

  ProductBuilder? _product;
  ProductBuilder get product => _$this._product ??= new ProductBuilder();
  set product(ProductBuilder? product) => _$this._product = product;

  ProductQuotationBuilder();

  ProductQuotationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _quantity = $v.quantity;
      _unitPrice = $v.unitPrice;
      _totalPrice = $v.totalPrice;
      _quotationId = $v.quotationId;
      _productId = $v.productId;
      _product = $v.product?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductQuotation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductQuotation;
  }

  @override
  void update(void Function(ProductQuotationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductQuotation build() => _build();

  _$ProductQuotation _build() {
    _$ProductQuotation _$result;
    try {
      _$result = _$v ??
          new _$ProductQuotation._(
              id: id,
              quantity: BuiltValueNullFieldError.checkNotNull(
                  quantity, 'ProductQuotation', 'quantity'),
              unitPrice: BuiltValueNullFieldError.checkNotNull(
                  unitPrice, 'ProductQuotation', 'unitPrice'),
              totalPrice: BuiltValueNullFieldError.checkNotNull(
                  totalPrice, 'ProductQuotation', 'totalPrice'),
              quotationId: BuiltValueNullFieldError.checkNotNull(
                  quotationId, 'ProductQuotation', 'quotationId'),
              productId: BuiltValueNullFieldError.checkNotNull(
                  productId, 'ProductQuotation', 'productId'),
              product: _product?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'product';
        _product?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProductQuotation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
