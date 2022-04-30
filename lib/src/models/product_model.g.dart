// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductData> _$productDataSerializer = new _$ProductDataSerializer();
Serializer<Product> _$productSerializer = new _$ProductSerializer();

class _$ProductDataSerializer implements StructuredSerializer<ProductData> {
  @override
  final Iterable<Type> types = const [ProductData, _$ProductData];
  @override
  final String wireName = 'ProductData';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'data',
      serializers.serialize(object.data,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Product)])),
    ];

    return result;
  }

  @override
  ProductData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Product)]))!
              as BuiltList<Object?>);
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
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'image_url',
      serializers.serialize(object.image_url,
          specifiedType: const FullType(String)),
      'length',
      serializers.serialize(object.length,
          specifiedType: const FullType(String)),
      'height',
      serializers.serialize(object.height,
          specifiedType: const FullType(String)),
      'weight',
      serializers.serialize(object.weight,
          specifiedType: const FullType(String)),
      'units_box',
      serializers.serialize(object.units_box,
          specifiedType: const FullType(int)),
      'brand_product',
      serializers.serialize(object.brand_product,
          specifiedType: const FullType(String)),
      'origin_product',
      serializers.serialize(object.origin_product,
          specifiedType: const FullType(String)),
    ];

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image_url':
          result.image_url = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'length':
          result.length = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'units_box':
          result.units_box = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'brand_product':
          result.brand_product = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'origin_product':
          result.origin_product = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductData extends ProductData {
  @override
  final BuiltList<Product> data;

  factory _$ProductData([void Function(ProductDataBuilder)? updates]) =>
      (new ProductDataBuilder()..update(updates)).build();

  _$ProductData._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, 'ProductData', 'data');
  }

  @override
  ProductData rebuild(void Function(ProductDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductDataBuilder toBuilder() => new ProductDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductData && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductData')..add('data', data))
        .toString();
  }
}

class ProductDataBuilder implements Builder<ProductData, ProductDataBuilder> {
  _$ProductData? _$v;

  ListBuilder<Product>? _data;
  ListBuilder<Product> get data => _$this._data ??= new ListBuilder<Product>();
  set data(ListBuilder<Product>? data) => _$this._data = data;

  ProductDataBuilder();

  ProductDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductData;
  }

  @override
  void update(void Function(ProductDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductData build() {
    _$ProductData _$result;
    try {
      _$result = _$v ?? new _$ProductData._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProductData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Product extends Product {
  @override
  final String name;
  @override
  final String image_url;
  @override
  final String length;
  @override
  final String height;
  @override
  final String weight;
  @override
  final int units_box;
  @override
  final String brand_product;
  @override
  final String origin_product;

  factory _$Product([void Function(ProductBuilder)? updates]) =>
      (new ProductBuilder()..update(updates)).build();

  _$Product._(
      {required this.name,
      required this.image_url,
      required this.length,
      required this.height,
      required this.weight,
      required this.units_box,
      required this.brand_product,
      required this.origin_product})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Product', 'name');
    BuiltValueNullFieldError.checkNotNull(image_url, 'Product', 'image_url');
    BuiltValueNullFieldError.checkNotNull(length, 'Product', 'length');
    BuiltValueNullFieldError.checkNotNull(height, 'Product', 'height');
    BuiltValueNullFieldError.checkNotNull(weight, 'Product', 'weight');
    BuiltValueNullFieldError.checkNotNull(units_box, 'Product', 'units_box');
    BuiltValueNullFieldError.checkNotNull(
        brand_product, 'Product', 'brand_product');
    BuiltValueNullFieldError.checkNotNull(
        origin_product, 'Product', 'origin_product');
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
        name == other.name &&
        image_url == other.image_url &&
        length == other.length &&
        height == other.height &&
        weight == other.weight &&
        units_box == other.units_box &&
        brand_product == other.brand_product &&
        origin_product == other.origin_product;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, name.hashCode), image_url.hashCode),
                            length.hashCode),
                        height.hashCode),
                    weight.hashCode),
                units_box.hashCode),
            brand_product.hashCode),
        origin_product.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Product')
          ..add('name', name)
          ..add('image_url', image_url)
          ..add('length', length)
          ..add('height', height)
          ..add('weight', weight)
          ..add('units_box', units_box)
          ..add('brand_product', brand_product)
          ..add('origin_product', origin_product))
        .toString();
  }
}

class ProductBuilder implements Builder<Product, ProductBuilder> {
  _$Product? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _image_url;
  String? get image_url => _$this._image_url;
  set image_url(String? image_url) => _$this._image_url = image_url;

  String? _length;
  String? get length => _$this._length;
  set length(String? length) => _$this._length = length;

  String? _height;
  String? get height => _$this._height;
  set height(String? height) => _$this._height = height;

  String? _weight;
  String? get weight => _$this._weight;
  set weight(String? weight) => _$this._weight = weight;

  int? _units_box;
  int? get units_box => _$this._units_box;
  set units_box(int? units_box) => _$this._units_box = units_box;

  String? _brand_product;
  String? get brand_product => _$this._brand_product;
  set brand_product(String? brand_product) =>
      _$this._brand_product = brand_product;

  String? _origin_product;
  String? get origin_product => _$this._origin_product;
  set origin_product(String? origin_product) =>
      _$this._origin_product = origin_product;

  ProductBuilder();

  ProductBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _image_url = $v.image_url;
      _length = $v.length;
      _height = $v.height;
      _weight = $v.weight;
      _units_box = $v.units_box;
      _brand_product = $v.brand_product;
      _origin_product = $v.origin_product;
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
  _$Product build() {
    final _$result = _$v ??
        new _$Product._(
            name:
                BuiltValueNullFieldError.checkNotNull(name, 'Product', 'name'),
            image_url: BuiltValueNullFieldError.checkNotNull(
                image_url, 'Product', 'image_url'),
            length: BuiltValueNullFieldError.checkNotNull(
                length, 'Product', 'length'),
            height: BuiltValueNullFieldError.checkNotNull(
                height, 'Product', 'height'),
            weight: BuiltValueNullFieldError.checkNotNull(
                weight, 'Product', 'weight'),
            units_box: BuiltValueNullFieldError.checkNotNull(
                units_box, 'Product', 'units_box'),
            brand_product: BuiltValueNullFieldError.checkNotNull(
                brand_product, 'Product', 'brand_product'),
            origin_product: BuiltValueNullFieldError.checkNotNull(
                origin_product, 'Product', 'origin_product'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
