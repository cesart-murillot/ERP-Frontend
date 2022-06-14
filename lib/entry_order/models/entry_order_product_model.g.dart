// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_order_product_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EntryOrderProduct> _$entryOrderProductSerializer =
    new _$EntryOrderProductSerializer();

class _$EntryOrderProductSerializer
    implements StructuredSerializer<EntryOrderProduct> {
  @override
  final Iterable<Type> types = const [EntryOrderProduct, _$EntryOrderProduct];
  @override
  final String wireName = 'EntryOrderProduct';

  @override
  Iterable<Object?> serialize(Serializers serializers, EntryOrderProduct object,
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
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.entryOrderId;
    if (value != null) {
      result
        ..add('entry_order_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.product;
    if (value != null) {
      result
        ..add('product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Product)));
    }
    value = object.entryOrder;
    if (value != null) {
      result
        ..add('entry_order')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(EntryOrder)));
    }
    return result;
  }

  @override
  EntryOrderProduct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntryOrderProductBuilder();

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
              specifiedType: const FullType(int)) as int?;
          break;
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
        case 'entry_order':
          result.entryOrder.replace(serializers.deserialize(value,
              specifiedType: const FullType(EntryOrder))! as EntryOrder);
          break;
      }
    }

    return result.build();
  }
}

class _$EntryOrderProduct extends EntryOrderProduct {
  @override
  final int? id;
  @override
  final int? entryOrderId;
  @override
  final int productId;
  @override
  final int quantity;
  @override
  final Product? product;
  @override
  final EntryOrder? entryOrder;

  factory _$EntryOrderProduct(
          [void Function(EntryOrderProductBuilder)? updates]) =>
      (new EntryOrderProductBuilder()..update(updates))._build();

  _$EntryOrderProduct._(
      {this.id,
      this.entryOrderId,
      required this.productId,
      required this.quantity,
      this.product,
      this.entryOrder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        productId, 'EntryOrderProduct', 'productId');
    BuiltValueNullFieldError.checkNotNull(
        quantity, 'EntryOrderProduct', 'quantity');
  }

  @override
  EntryOrderProduct rebuild(void Function(EntryOrderProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryOrderProductBuilder toBuilder() =>
      new EntryOrderProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EntryOrderProduct &&
        id == other.id &&
        entryOrderId == other.entryOrderId &&
        productId == other.productId &&
        quantity == other.quantity &&
        product == other.product &&
        entryOrder == other.entryOrder;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), entryOrderId.hashCode),
                    productId.hashCode),
                quantity.hashCode),
            product.hashCode),
        entryOrder.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EntryOrderProduct')
          ..add('id', id)
          ..add('entryOrderId', entryOrderId)
          ..add('productId', productId)
          ..add('quantity', quantity)
          ..add('product', product)
          ..add('entryOrder', entryOrder))
        .toString();
  }
}

class EntryOrderProductBuilder
    implements Builder<EntryOrderProduct, EntryOrderProductBuilder> {
  _$EntryOrderProduct? _$v;

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

  ProductBuilder? _product;
  ProductBuilder get product => _$this._product ??= new ProductBuilder();
  set product(ProductBuilder? product) => _$this._product = product;

  EntryOrderBuilder? _entryOrder;
  EntryOrderBuilder get entryOrder =>
      _$this._entryOrder ??= new EntryOrderBuilder();
  set entryOrder(EntryOrderBuilder? entryOrder) =>
      _$this._entryOrder = entryOrder;

  EntryOrderProductBuilder();

  EntryOrderProductBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _entryOrderId = $v.entryOrderId;
      _productId = $v.productId;
      _quantity = $v.quantity;
      _product = $v.product?.toBuilder();
      _entryOrder = $v.entryOrder?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EntryOrderProduct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EntryOrderProduct;
  }

  @override
  void update(void Function(EntryOrderProductBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EntryOrderProduct build() => _build();

  _$EntryOrderProduct _build() {
    _$EntryOrderProduct _$result;
    try {
      _$result = _$v ??
          new _$EntryOrderProduct._(
              id: id,
              entryOrderId: entryOrderId,
              productId: BuiltValueNullFieldError.checkNotNull(
                  productId, 'EntryOrderProduct', 'productId'),
              quantity: BuiltValueNullFieldError.checkNotNull(
                  quantity, 'EntryOrderProduct', 'quantity'),
              product: _product?.build(),
              entryOrder: _entryOrder?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'product';
        _product?.build();
        _$failedField = 'entryOrder';
        _entryOrder?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EntryOrderProduct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
