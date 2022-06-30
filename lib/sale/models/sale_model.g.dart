// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Sales> _$salesSerializer = new _$SalesSerializer();
Serializer<Sale> _$saleSerializer = new _$SaleSerializer();
Serializer<ProductSale> _$productSaleSerializer = new _$ProductSaleSerializer();

class _$SalesSerializer implements StructuredSerializer<Sales> {
  @override
  final Iterable<Type> types = const [Sales, _$Sales];
  @override
  final String wireName = 'Sales';

  @override
  Iterable<Object?> serialize(Serializers serializers, Sales object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'sales',
      serializers.serialize(object.sales,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Sale)])),
    ];

    return result;
  }

  @override
  Sales deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SalesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sales':
          result.sales.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Sale)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$SaleSerializer implements StructuredSerializer<Sale> {
  @override
  final Iterable<Type> types = const [Sale, _$Sale];
  @override
  final String wireName = 'Sale';

  @override
  Iterable<Object?> serialize(Serializers serializers, Sale object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'total_sale',
      serializers.serialize(object.totalSale,
          specifiedType: const FullType(double)),
      'date_sale',
      serializers.serialize(object.dateSale,
          specifiedType: const FullType(String)),
      'user_id',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'branch_id',
      serializers.serialize(object.branchId,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.quotationId;
    if (value != null) {
      result
        ..add('quotation_id')
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
    value = object.productSales;
    if (value != null) {
      result
        ..add('product_sales')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(ProductSale)])));
    }
    return result;
  }

  @override
  Sale deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SaleBuilder();

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
        case 'total_sale':
          result.totalSale = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'date_sale':
          result.dateSale = serializers.deserialize(value,
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
        case 'quotation_id':
          result.quotationId = serializers.deserialize(value,
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
        case 'product_sales':
          result.productSales.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductSale)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ProductSaleSerializer implements StructuredSerializer<ProductSale> {
  @override
  final Iterable<Type> types = const [ProductSale, _$ProductSale];
  @override
  final String wireName = 'ProductSale';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductSale object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'unit_price',
      serializers.serialize(object.unitPrice,
          specifiedType: const FullType(double)),
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(int)),
      'total_price',
      serializers.serialize(object.totalPrice,
          specifiedType: const FullType(double)),
      'sale_id',
      serializers.serialize(object.saleId, specifiedType: const FullType(int)),
      'product_id',
      serializers.serialize(object.productId,
          specifiedType: const FullType(int)),
    ];
    Object? value;
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
  ProductSale deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductSaleBuilder();

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
        case 'unit_price':
          result.unitPrice = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'total_price':
          result.totalPrice = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'sale_id':
          result.saleId = serializers.deserialize(value,
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

class _$Sales extends Sales {
  @override
  final BuiltList<Sale> sales;

  factory _$Sales([void Function(SalesBuilder)? updates]) =>
      (new SalesBuilder()..update(updates))._build();

  _$Sales._({required this.sales}) : super._() {
    BuiltValueNullFieldError.checkNotNull(sales, 'Sales', 'sales');
  }

  @override
  Sales rebuild(void Function(SalesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SalesBuilder toBuilder() => new SalesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Sales && sales == other.sales;
  }

  @override
  int get hashCode {
    return $jf($jc(0, sales.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Sales')..add('sales', sales))
        .toString();
  }
}

class SalesBuilder implements Builder<Sales, SalesBuilder> {
  _$Sales? _$v;

  ListBuilder<Sale>? _sales;
  ListBuilder<Sale> get sales => _$this._sales ??= new ListBuilder<Sale>();
  set sales(ListBuilder<Sale>? sales) => _$this._sales = sales;

  SalesBuilder();

  SalesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sales = $v.sales.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Sales other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Sales;
  }

  @override
  void update(void Function(SalesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Sales build() => _build();

  _$Sales _build() {
    _$Sales _$result;
    try {
      _$result = _$v ?? new _$Sales._(sales: sales.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'sales';
        sales.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Sales', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Sale extends Sale {
  @override
  final int id;
  @override
  final double totalSale;
  @override
  final String dateSale;
  @override
  final int userId;
  @override
  final int branchId;
  @override
  final int? quotationId;
  @override
  final User? user;
  @override
  final Branch? branch;
  @override
  final BuiltList<ProductSale>? productSales;

  factory _$Sale([void Function(SaleBuilder)? updates]) =>
      (new SaleBuilder()..update(updates))._build();

  _$Sale._(
      {required this.id,
      required this.totalSale,
      required this.dateSale,
      required this.userId,
      required this.branchId,
      this.quotationId,
      this.user,
      this.branch,
      this.productSales})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Sale', 'id');
    BuiltValueNullFieldError.checkNotNull(totalSale, 'Sale', 'totalSale');
    BuiltValueNullFieldError.checkNotNull(dateSale, 'Sale', 'dateSale');
    BuiltValueNullFieldError.checkNotNull(userId, 'Sale', 'userId');
    BuiltValueNullFieldError.checkNotNull(branchId, 'Sale', 'branchId');
  }

  @override
  Sale rebuild(void Function(SaleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SaleBuilder toBuilder() => new SaleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Sale &&
        id == other.id &&
        totalSale == other.totalSale &&
        dateSale == other.dateSale &&
        userId == other.userId &&
        branchId == other.branchId &&
        quotationId == other.quotationId &&
        user == other.user &&
        branch == other.branch &&
        productSales == other.productSales;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), totalSale.hashCode),
                                dateSale.hashCode),
                            userId.hashCode),
                        branchId.hashCode),
                    quotationId.hashCode),
                user.hashCode),
            branch.hashCode),
        productSales.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Sale')
          ..add('id', id)
          ..add('totalSale', totalSale)
          ..add('dateSale', dateSale)
          ..add('userId', userId)
          ..add('branchId', branchId)
          ..add('quotationId', quotationId)
          ..add('user', user)
          ..add('branch', branch)
          ..add('productSales', productSales))
        .toString();
  }
}

class SaleBuilder implements Builder<Sale, SaleBuilder> {
  _$Sale? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  double? _totalSale;
  double? get totalSale => _$this._totalSale;
  set totalSale(double? totalSale) => _$this._totalSale = totalSale;

  String? _dateSale;
  String? get dateSale => _$this._dateSale;
  set dateSale(String? dateSale) => _$this._dateSale = dateSale;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  int? _branchId;
  int? get branchId => _$this._branchId;
  set branchId(int? branchId) => _$this._branchId = branchId;

  int? _quotationId;
  int? get quotationId => _$this._quotationId;
  set quotationId(int? quotationId) => _$this._quotationId = quotationId;

  UserBuilder? _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder? user) => _$this._user = user;

  BranchBuilder? _branch;
  BranchBuilder get branch => _$this._branch ??= new BranchBuilder();
  set branch(BranchBuilder? branch) => _$this._branch = branch;

  ListBuilder<ProductSale>? _productSales;
  ListBuilder<ProductSale> get productSales =>
      _$this._productSales ??= new ListBuilder<ProductSale>();
  set productSales(ListBuilder<ProductSale>? productSales) =>
      _$this._productSales = productSales;

  SaleBuilder();

  SaleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _totalSale = $v.totalSale;
      _dateSale = $v.dateSale;
      _userId = $v.userId;
      _branchId = $v.branchId;
      _quotationId = $v.quotationId;
      _user = $v.user?.toBuilder();
      _branch = $v.branch?.toBuilder();
      _productSales = $v.productSales?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Sale other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Sale;
  }

  @override
  void update(void Function(SaleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Sale build() => _build();

  _$Sale _build() {
    _$Sale _$result;
    try {
      _$result = _$v ??
          new _$Sale._(
              id: BuiltValueNullFieldError.checkNotNull(id, 'Sale', 'id'),
              totalSale: BuiltValueNullFieldError.checkNotNull(
                  totalSale, 'Sale', 'totalSale'),
              dateSale: BuiltValueNullFieldError.checkNotNull(
                  dateSale, 'Sale', 'dateSale'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, 'Sale', 'userId'),
              branchId: BuiltValueNullFieldError.checkNotNull(
                  branchId, 'Sale', 'branchId'),
              quotationId: quotationId,
              user: _user?.build(),
              branch: _branch?.build(),
              productSales: _productSales?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'branch';
        _branch?.build();
        _$failedField = 'productSales';
        _productSales?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Sale', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ProductSale extends ProductSale {
  @override
  final int id;
  @override
  final double unitPrice;
  @override
  final int quantity;
  @override
  final double totalPrice;
  @override
  final int saleId;
  @override
  final int productId;
  @override
  final Product? product;

  factory _$ProductSale([void Function(ProductSaleBuilder)? updates]) =>
      (new ProductSaleBuilder()..update(updates))._build();

  _$ProductSale._(
      {required this.id,
      required this.unitPrice,
      required this.quantity,
      required this.totalPrice,
      required this.saleId,
      required this.productId,
      this.product})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'ProductSale', 'id');
    BuiltValueNullFieldError.checkNotNull(
        unitPrice, 'ProductSale', 'unitPrice');
    BuiltValueNullFieldError.checkNotNull(quantity, 'ProductSale', 'quantity');
    BuiltValueNullFieldError.checkNotNull(
        totalPrice, 'ProductSale', 'totalPrice');
    BuiltValueNullFieldError.checkNotNull(saleId, 'ProductSale', 'saleId');
    BuiltValueNullFieldError.checkNotNull(
        productId, 'ProductSale', 'productId');
  }

  @override
  ProductSale rebuild(void Function(ProductSaleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductSaleBuilder toBuilder() => new ProductSaleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductSale &&
        id == other.id &&
        unitPrice == other.unitPrice &&
        quantity == other.quantity &&
        totalPrice == other.totalPrice &&
        saleId == other.saleId &&
        productId == other.productId &&
        product == other.product;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), unitPrice.hashCode),
                        quantity.hashCode),
                    totalPrice.hashCode),
                saleId.hashCode),
            productId.hashCode),
        product.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductSale')
          ..add('id', id)
          ..add('unitPrice', unitPrice)
          ..add('quantity', quantity)
          ..add('totalPrice', totalPrice)
          ..add('saleId', saleId)
          ..add('productId', productId)
          ..add('product', product))
        .toString();
  }
}

class ProductSaleBuilder implements Builder<ProductSale, ProductSaleBuilder> {
  _$ProductSale? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  double? _unitPrice;
  double? get unitPrice => _$this._unitPrice;
  set unitPrice(double? unitPrice) => _$this._unitPrice = unitPrice;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  double? _totalPrice;
  double? get totalPrice => _$this._totalPrice;
  set totalPrice(double? totalPrice) => _$this._totalPrice = totalPrice;

  int? _saleId;
  int? get saleId => _$this._saleId;
  set saleId(int? saleId) => _$this._saleId = saleId;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

  ProductBuilder? _product;
  ProductBuilder get product => _$this._product ??= new ProductBuilder();
  set product(ProductBuilder? product) => _$this._product = product;

  ProductSaleBuilder();

  ProductSaleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _unitPrice = $v.unitPrice;
      _quantity = $v.quantity;
      _totalPrice = $v.totalPrice;
      _saleId = $v.saleId;
      _productId = $v.productId;
      _product = $v.product?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductSale other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductSale;
  }

  @override
  void update(void Function(ProductSaleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductSale build() => _build();

  _$ProductSale _build() {
    _$ProductSale _$result;
    try {
      _$result = _$v ??
          new _$ProductSale._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, 'ProductSale', 'id'),
              unitPrice: BuiltValueNullFieldError.checkNotNull(
                  unitPrice, 'ProductSale', 'unitPrice'),
              quantity: BuiltValueNullFieldError.checkNotNull(
                  quantity, 'ProductSale', 'quantity'),
              totalPrice: BuiltValueNullFieldError.checkNotNull(
                  totalPrice, 'ProductSale', 'totalPrice'),
              saleId: BuiltValueNullFieldError.checkNotNull(
                  saleId, 'ProductSale', 'saleId'),
              productId: BuiltValueNullFieldError.checkNotNull(
                  productId, 'ProductSale', 'productId'),
              product: _product?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'product';
        _product?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProductSale', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
