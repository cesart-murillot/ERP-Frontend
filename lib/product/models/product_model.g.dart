// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Products> _$productsSerializer = new _$ProductsSerializer();
Serializer<Product> _$productSerializer = new _$ProductSerializer();

class _$ProductsSerializer implements StructuredSerializer<Products> {
  @override
  final Iterable<Type> types = const [Products, _$Products];
  @override
  final String wireName = 'Products';

  @override
  Iterable<Object?> serialize(Serializers serializers, Products object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'products',
      serializers.serialize(object.products,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Product)])),
    ];
    Object? value;
    value = object.links;
    if (value != null) {
      result
        ..add('links')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LinkData)));
    }
    value = object.meta;
    if (value != null) {
      result
        ..add('meta')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(MetaData)));
    }
    return result;
  }

  @override
  Products deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'products':
          result.products.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Product)]))!
              as BuiltList<Object?>);
          break;
        case 'links':
          result.links.replace(serializers.deserialize(value,
              specifiedType: const FullType(LinkData))! as LinkData);
          break;
        case 'meta':
          result.meta.replace(serializers.deserialize(value,
              specifiedType: const FullType(MetaData))! as MetaData);
          break;
      }
    }

    return result.build();
  }
}

class _$ProductSerializer implements StructuredSerializer<Product> {
  @override
  final Iterable<Type> types = const [Product, _$Product];
  @override
  final String wireName = 'Product';

  @override
  Iterable<Object?> serialize(Serializers serializers, Product object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name_product',
      serializers.serialize(object.nameProduct,
          specifiedType: const FullType(String)),
      'origin_product',
      serializers.serialize(object.originProduct,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.imageProduct;
    if (value != null) {
      result
        ..add('image_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lengthProduct;
    if (value != null) {
      result
        ..add('length_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.heightProduct;
    if (value != null) {
      result
        ..add('height_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.weightProduct;
    if (value != null) {
      result
        ..add('weight_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.unitsBoxProduct;
    if (value != null) {
      result
        ..add('units_box_product')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.brandProduct;
    if (value != null) {
      result
        ..add('brand_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Product deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductBuilder();

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
        case 'name_product':
          result.nameProduct = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image_product':
          result.imageProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'length_product':
          result.lengthProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'height_product':
          result.heightProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'weight_product':
          result.weightProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'units_box_product':
          result.unitsBoxProduct = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'brand_product':
          result.brandProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'origin_product':
          result.originProduct = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Products extends Products {
  @override
  final BuiltList<Product> products;
  @override
  final LinkData? links;
  @override
  final MetaData? meta;

  factory _$Products([void Function(ProductsBuilder)? updates]) =>
      (new ProductsBuilder()..update(updates))._build();

  _$Products._({required this.products, this.links, this.meta}) : super._() {
    BuiltValueNullFieldError.checkNotNull(products, 'Products', 'products');
  }

  @override
  Products rebuild(void Function(ProductsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductsBuilder toBuilder() => new ProductsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Products &&
        products == other.products &&
        links == other.links &&
        meta == other.meta;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, products.hashCode), links.hashCode), meta.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Products')
          ..add('products', products)
          ..add('links', links)
          ..add('meta', meta))
        .toString();
  }
}

class ProductsBuilder implements Builder<Products, ProductsBuilder> {
  _$Products? _$v;

  ListBuilder<Product>? _products;
  ListBuilder<Product> get products =>
      _$this._products ??= new ListBuilder<Product>();
  set products(ListBuilder<Product>? products) => _$this._products = products;

  LinkDataBuilder? _links;
  LinkDataBuilder get links => _$this._links ??= new LinkDataBuilder();
  set links(LinkDataBuilder? links) => _$this._links = links;

  MetaDataBuilder? _meta;
  MetaDataBuilder get meta => _$this._meta ??= new MetaDataBuilder();
  set meta(MetaDataBuilder? meta) => _$this._meta = meta;

  ProductsBuilder();

  ProductsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _products = $v.products.toBuilder();
      _links = $v.links?.toBuilder();
      _meta = $v.meta?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Products other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Products;
  }

  @override
  void update(void Function(ProductsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Products build() => _build();

  _$Products _build() {
    _$Products _$result;
    try {
      _$result = _$v ??
          new _$Products._(
              products: products.build(),
              links: _links?.build(),
              meta: _meta?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'products';
        products.build();
        _$failedField = 'links';
        _links?.build();
        _$failedField = 'meta';
        _meta?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Products', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Product extends Product {
  @override
  final int? id;
  @override
  final String nameProduct;
  @override
  final String? imageProduct;
  @override
  final String? lengthProduct;
  @override
  final String? heightProduct;
  @override
  final String? weightProduct;
  @override
  final int? unitsBoxProduct;
  @override
  final String? brandProduct;
  @override
  final String originProduct;

  factory _$Product([void Function(ProductBuilder)? updates]) =>
      (new ProductBuilder()..update(updates))._build();

  _$Product._(
      {this.id,
      required this.nameProduct,
      this.imageProduct,
      this.lengthProduct,
      this.heightProduct,
      this.weightProduct,
      this.unitsBoxProduct,
      this.brandProduct,
      required this.originProduct})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        nameProduct, 'Product', 'nameProduct');
    BuiltValueNullFieldError.checkNotNull(
        originProduct, 'Product', 'originProduct');
  }

  @override
  Product rebuild(void Function(ProductBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductBuilder toBuilder() => new ProductBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Product &&
        id == other.id &&
        nameProduct == other.nameProduct &&
        imageProduct == other.imageProduct &&
        lengthProduct == other.lengthProduct &&
        heightProduct == other.heightProduct &&
        weightProduct == other.weightProduct &&
        unitsBoxProduct == other.unitsBoxProduct &&
        brandProduct == other.brandProduct &&
        originProduct == other.originProduct;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), nameProduct.hashCode),
                                imageProduct.hashCode),
                            lengthProduct.hashCode),
                        heightProduct.hashCode),
                    weightProduct.hashCode),
                unitsBoxProduct.hashCode),
            brandProduct.hashCode),
        originProduct.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Product')
          ..add('id', id)
          ..add('nameProduct', nameProduct)
          ..add('imageProduct', imageProduct)
          ..add('lengthProduct', lengthProduct)
          ..add('heightProduct', heightProduct)
          ..add('weightProduct', weightProduct)
          ..add('unitsBoxProduct', unitsBoxProduct)
          ..add('brandProduct', brandProduct)
          ..add('originProduct', originProduct))
        .toString();
  }
}

class ProductBuilder implements Builder<Product, ProductBuilder> {
  _$Product? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _nameProduct;
  String? get nameProduct => _$this._nameProduct;
  set nameProduct(String? nameProduct) => _$this._nameProduct = nameProduct;

  String? _imageProduct;
  String? get imageProduct => _$this._imageProduct;
  set imageProduct(String? imageProduct) => _$this._imageProduct = imageProduct;

  String? _lengthProduct;
  String? get lengthProduct => _$this._lengthProduct;
  set lengthProduct(String? lengthProduct) =>
      _$this._lengthProduct = lengthProduct;

  String? _heightProduct;
  String? get heightProduct => _$this._heightProduct;
  set heightProduct(String? heightProduct) =>
      _$this._heightProduct = heightProduct;

  String? _weightProduct;
  String? get weightProduct => _$this._weightProduct;
  set weightProduct(String? weightProduct) =>
      _$this._weightProduct = weightProduct;

  int? _unitsBoxProduct;
  int? get unitsBoxProduct => _$this._unitsBoxProduct;
  set unitsBoxProduct(int? unitsBoxProduct) =>
      _$this._unitsBoxProduct = unitsBoxProduct;

  String? _brandProduct;
  String? get brandProduct => _$this._brandProduct;
  set brandProduct(String? brandProduct) => _$this._brandProduct = brandProduct;

  String? _originProduct;
  String? get originProduct => _$this._originProduct;
  set originProduct(String? originProduct) =>
      _$this._originProduct = originProduct;

  ProductBuilder();

  ProductBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nameProduct = $v.nameProduct;
      _imageProduct = $v.imageProduct;
      _lengthProduct = $v.lengthProduct;
      _heightProduct = $v.heightProduct;
      _weightProduct = $v.weightProduct;
      _unitsBoxProduct = $v.unitsBoxProduct;
      _brandProduct = $v.brandProduct;
      _originProduct = $v.originProduct;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Product other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Product;
  }

  @override
  void update(void Function(ProductBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Product build() => _build();

  _$Product _build() {
    final _$result = _$v ??
        new _$Product._(
            id: id,
            nameProduct: BuiltValueNullFieldError.checkNotNull(
                nameProduct, 'Product', 'nameProduct'),
            imageProduct: imageProduct,
            lengthProduct: lengthProduct,
            heightProduct: heightProduct,
            weightProduct: weightProduct,
            unitsBoxProduct: unitsBoxProduct,
            brandProduct: brandProduct,
            originProduct: BuiltValueNullFieldError.checkNotNull(
                originProduct, 'Product', 'originProduct'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
