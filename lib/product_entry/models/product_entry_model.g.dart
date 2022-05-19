// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entry_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductEntries> _$productEntriesSerializer =
    new _$ProductEntriesSerializer();
Serializer<ProductEntry> _$productEntrySerializer =
    new _$ProductEntrySerializer();

class _$ProductEntriesSerializer
    implements StructuredSerializer<ProductEntries> {
  @override
  final Iterable<Type> types = const [ProductEntries, _$ProductEntries];
  @override
  final String wireName = 'ProductEntries';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductEntries object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'product_entries',
      serializers.serialize(object.productEntries,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ProductEntry)])),
    ];

    return result;
  }

  @override
  ProductEntries deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductEntriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'product_entries':
          result.productEntries.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProductEntry)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ProductEntrySerializer implements StructuredSerializer<ProductEntry> {
  @override
  final Iterable<Type> types = const [ProductEntry, _$ProductEntry];
  @override
  final String wireName = 'ProductEntry';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductEntry object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'entry_order_id',
      serializers.serialize(object.entryOrderId,
          specifiedType: const FullType(int)),
      'product_id',
      serializers.serialize(object.productId,
          specifiedType: const FullType(int)),
      'quantity',
      serializers.serialize(object.quantity,
          specifiedType: const FullType(int)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'product',
      serializers.serialize(object.product,
          specifiedType: const FullType(Product)),
      'entry_order',
      serializers.serialize(object.entryOrder,
          specifiedType: const FullType(EntryOrder)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.verified;
    if (value != null) {
      result
        ..add('verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.error;
    if (value != null) {
      result
        ..add('error')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  ProductEntry deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductEntryBuilder();

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
        case 'entry_order_id':
          result.entryOrderId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'product_id':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'verified':
          result.verified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'product':
          result.product.replace(serializers.deserialize(value,
              specifiedType: const FullType(Product))! as Product);
          break;
        case 'entry_order':
          result.entryOrder.replace(serializers.deserialize(value,
              specifiedType: const FullType(EntryOrder))! as EntryOrder);
          break;
      }
    }

    return result.build();
  }
}

class _$ProductEntries extends ProductEntries {
  @override
  final BuiltList<ProductEntry> productEntries;

  factory _$ProductEntries([void Function(ProductEntriesBuilder)? updates]) =>
      (new ProductEntriesBuilder()..update(updates))._build();

  _$ProductEntries._({required this.productEntries}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        productEntries, 'ProductEntries', 'productEntries');
  }

  @override
  ProductEntries rebuild(void Function(ProductEntriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductEntriesBuilder toBuilder() =>
      new ProductEntriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductEntries && productEntries == other.productEntries;
  }

  @override
  int get hashCode {
    return $jf($jc(0, productEntries.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductEntries')
          ..add('productEntries', productEntries))
        .toString();
  }
}

class ProductEntriesBuilder
    implements Builder<ProductEntries, ProductEntriesBuilder> {
  _$ProductEntries? _$v;

  ListBuilder<ProductEntry>? _productEntries;
  ListBuilder<ProductEntry> get productEntries =>
      _$this._productEntries ??= new ListBuilder<ProductEntry>();
  set productEntries(ListBuilder<ProductEntry>? productEntries) =>
      _$this._productEntries = productEntries;

  ProductEntriesBuilder();

  ProductEntriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _productEntries = $v.productEntries.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductEntries other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductEntries;
  }

  @override
  void update(void Function(ProductEntriesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductEntries build() => _build();

  _$ProductEntries _build() {
    _$ProductEntries _$result;
    try {
      _$result =
          _$v ?? new _$ProductEntries._(productEntries: productEntries.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'productEntries';
        productEntries.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProductEntries', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ProductEntry extends ProductEntry {
  @override
  final int? id;
  @override
  final int entryOrderId;
  @override
  final int productId;
  @override
  final int quantity;
  @override
  final bool? verified;
  @override
  final bool? error;
  @override
  final String createdAt;
  @override
  final Product product;
  @override
  final EntryOrder entryOrder;

  factory _$ProductEntry([void Function(ProductEntryBuilder)? updates]) =>
      (new ProductEntryBuilder()..update(updates))._build();

  _$ProductEntry._(
      {this.id,
      required this.entryOrderId,
      required this.productId,
      required this.quantity,
      this.verified,
      this.error,
      required this.createdAt,
      required this.product,
      required this.entryOrder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        entryOrderId, 'ProductEntry', 'entryOrderId');
    BuiltValueNullFieldError.checkNotNull(
        productId, 'ProductEntry', 'productId');
    BuiltValueNullFieldError.checkNotNull(quantity, 'ProductEntry', 'quantity');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, 'ProductEntry', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(product, 'ProductEntry', 'product');
    BuiltValueNullFieldError.checkNotNull(
        entryOrder, 'ProductEntry', 'entryOrder');
  }

  @override
  ProductEntry rebuild(void Function(ProductEntryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductEntryBuilder toBuilder() => new ProductEntryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductEntry &&
        id == other.id &&
        entryOrderId == other.entryOrderId &&
        productId == other.productId &&
        quantity == other.quantity &&
        verified == other.verified &&
        error == other.error &&
        createdAt == other.createdAt &&
        product == other.product &&
        entryOrder == other.entryOrder;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), entryOrderId.hashCode),
                                productId.hashCode),
                            quantity.hashCode),
                        verified.hashCode),
                    error.hashCode),
                createdAt.hashCode),
            product.hashCode),
        entryOrder.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductEntry')
          ..add('id', id)
          ..add('entryOrderId', entryOrderId)
          ..add('productId', productId)
          ..add('quantity', quantity)
          ..add('verified', verified)
          ..add('error', error)
          ..add('createdAt', createdAt)
          ..add('product', product)
          ..add('entryOrder', entryOrder))
        .toString();
  }
}

class ProductEntryBuilder
    implements Builder<ProductEntry, ProductEntryBuilder> {
  _$ProductEntry? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _entryOrderId;
  int? get entryOrderId => _$this._entryOrderId;
  set entryOrderId(int? entryOrderId) => _$this._entryOrderId = entryOrderId;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(bool? verified) => _$this._verified = verified;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  ProductBuilder? _product;
  ProductBuilder get product => _$this._product ??= new ProductBuilder();
  set product(ProductBuilder? product) => _$this._product = product;

  EntryOrderBuilder? _entryOrder;
  EntryOrderBuilder get entryOrder =>
      _$this._entryOrder ??= new EntryOrderBuilder();
  set entryOrder(EntryOrderBuilder? entryOrder) =>
      _$this._entryOrder = entryOrder;

  ProductEntryBuilder();

  ProductEntryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _entryOrderId = $v.entryOrderId;
      _productId = $v.productId;
      _quantity = $v.quantity;
      _verified = $v.verified;
      _error = $v.error;
      _createdAt = $v.createdAt;
      _product = $v.product.toBuilder();
      _entryOrder = $v.entryOrder.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductEntry other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductEntry;
  }

  @override
  void update(void Function(ProductEntryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductEntry build() => _build();

  _$ProductEntry _build() {
    _$ProductEntry _$result;
    try {
      _$result = _$v ??
          new _$ProductEntry._(
              id: id,
              entryOrderId: BuiltValueNullFieldError.checkNotNull(
                  entryOrderId, 'ProductEntry', 'entryOrderId'),
              productId: BuiltValueNullFieldError.checkNotNull(
                  productId, 'ProductEntry', 'productId'),
              quantity: BuiltValueNullFieldError.checkNotNull(
                  quantity, 'ProductEntry', 'quantity'),
              verified: verified,
              error: error,
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, 'ProductEntry', 'createdAt'),
              product: product.build(),
              entryOrder: entryOrder.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'product';
        product.build();
        _$failedField = 'entryOrder';
        entryOrder.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProductEntry', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
