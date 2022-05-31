// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_transfer_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductTransfer> _$productTransferSerializer =
    new _$ProductTransferSerializer();

class _$ProductTransferSerializer
    implements StructuredSerializer<ProductTransfer> {
  @override
  final Iterable<Type> types = const [ProductTransfer, _$ProductTransfer];
  @override
  final String wireName = 'ProductTransfer';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductTransfer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'product_id',
      serializers.serialize(object.productId,
          specifiedType: const FullType(int)),
      'quantity',
      serializers.serialize(object.quantity,
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
  ProductTransfer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductTransferBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'product_id':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
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

class _$ProductTransfer extends ProductTransfer {
  @override
  final int productId;
  @override
  final int quantity;
  @override
  final Product? product;

  factory _$ProductTransfer([void Function(ProductTransferBuilder)? updates]) =>
      (new ProductTransferBuilder()..update(updates))._build();

  _$ProductTransfer._(
      {required this.productId, required this.quantity, this.product})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        productId, 'ProductTransfer', 'productId');
    BuiltValueNullFieldError.checkNotNull(
        quantity, 'ProductTransfer', 'quantity');
  }

  @override
  ProductTransfer rebuild(void Function(ProductTransferBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductTransferBuilder toBuilder() =>
      new ProductTransferBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductTransfer &&
        productId == other.productId &&
        quantity == other.quantity &&
        product == other.product;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, productId.hashCode), quantity.hashCode), product.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductTransfer')
          ..add('productId', productId)
          ..add('quantity', quantity)
          ..add('product', product))
        .toString();
  }
}

class ProductTransferBuilder
    implements Builder<ProductTransfer, ProductTransferBuilder> {
  _$ProductTransfer? _$v;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

  int? _quantity;
  int? get quantity => _$this._quantity;
  set quantity(int? quantity) => _$this._quantity = quantity;

  ProductBuilder? _product;
  ProductBuilder get product => _$this._product ??= new ProductBuilder();
  set product(ProductBuilder? product) => _$this._product = product;

  ProductTransferBuilder();

  ProductTransferBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _productId = $v.productId;
      _quantity = $v.quantity;
      _product = $v.product?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductTransfer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductTransfer;
  }

  @override
  void update(void Function(ProductTransferBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductTransfer build() => _build();

  _$ProductTransfer _build() {
    _$ProductTransfer _$result;
    try {
      _$result = _$v ??
          new _$ProductTransfer._(
              productId: BuiltValueNullFieldError.checkNotNull(
                  productId, 'ProductTransfer', 'productId'),
              quantity: BuiltValueNullFieldError.checkNotNull(
                  quantity, 'ProductTransfer', 'quantity'),
              product: _product?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'product';
        _product?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProductTransfer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
