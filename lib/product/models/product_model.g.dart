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
      'model_product',
      serializers.serialize(object.modelProduct,
          specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(double)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.descriptionProduct;
    if (value != null) {
      result
        ..add('description_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.urlImageProduct;
    if (value != null) {
      result
        ..add('url_image_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.formatProduct;
    if (value != null) {
      result
        ..add('format_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.codeProduct;
    if (value != null) {
      result
        ..add('code_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.familyProduct;
    if (value != null) {
      result
        ..add('family_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.finishProduct;
    if (value != null) {
      result
        ..add('finish_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.brandProduct;
    if (value != null) {
      result
        ..add('brand_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.originProduct;
    if (value != null) {
      result
        ..add('origin_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.unitMeasureProduct;
    if (value != null) {
      result
        ..add('unit_measure_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.unitsBoxProduct;
    if (value != null) {
      result
        ..add('units_box_product')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.areaBoxProduct;
    if (value != null) {
      result
        ..add('area_box_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.boxesPalletProduct;
    if (value != null) {
      result
        ..add('boxes_pallet_product')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.areaPalletProduct;
    if (value != null) {
      result
        ..add('area_pallet_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.weightBoxProduct;
    if (value != null) {
      result
        ..add('weight_box_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.weightPalletProduct;
    if (value != null) {
      result
        ..add('weight_pallet_product')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.remainUnits;
    if (value != null) {
      result
        ..add('remain_units')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reorderPoint;
    if (value != null) {
      result
        ..add('reorder_point')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.branchRemainUnits;
    if (value != null) {
      result
        ..add('branch_remain_units')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.estimateTime;
    if (value != null) {
      result
        ..add('estimate_time')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
        case 'model_product':
          result.modelProduct = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description_product':
          result.descriptionProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url_image_product':
          result.urlImageProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'format_product':
          result.formatProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'code_product':
          result.codeProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'family_product':
          result.familyProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'finish_product':
          result.finishProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'brand_product':
          result.brandProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'origin_product':
          result.originProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'unit_measure_product':
          result.unitMeasureProduct = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'units_box_product':
          result.unitsBoxProduct = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'area_box_product':
          result.areaBoxProduct = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'boxes_pallet_product':
          result.boxesPalletProduct = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'area_pallet_product':
          result.areaPalletProduct = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'weight_box_product':
          result.weightBoxProduct = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'weight_pallet_product':
          result.weightPalletProduct = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'remain_units':
          result.remainUnits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'reorder_point':
          result.reorderPoint = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'branch_remain_units':
          result.branchRemainUnits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'estimate_time':
          result.estimateTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
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
  final String modelProduct;
  @override
  final String? descriptionProduct;
  @override
  final String? urlImageProduct;
  @override
  final String? formatProduct;
  @override
  final String? codeProduct;
  @override
  final String? familyProduct;
  @override
  final String? finishProduct;
  @override
  final String? brandProduct;
  @override
  final String? originProduct;
  @override
  final String? unitMeasureProduct;
  @override
  final int? unitsBoxProduct;
  @override
  final double? areaBoxProduct;
  @override
  final int? boxesPalletProduct;
  @override
  final double? areaPalletProduct;
  @override
  final double? weightBoxProduct;
  @override
  final double? weightPalletProduct;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final int? remainUnits;
  @override
  final int? reorderPoint;
  @override
  final int? branchRemainUnits;
  @override
  final int? estimateTime;
  @override
  final double price;

  factory _$Product([void Function(ProductBuilder)? updates]) =>
      (new ProductBuilder()..update(updates))._build();

  _$Product._(
      {this.id,
      required this.modelProduct,
      this.descriptionProduct,
      this.urlImageProduct,
      this.formatProduct,
      this.codeProduct,
      this.familyProduct,
      this.finishProduct,
      this.brandProduct,
      this.originProduct,
      this.unitMeasureProduct,
      this.unitsBoxProduct,
      this.areaBoxProduct,
      this.boxesPalletProduct,
      this.areaPalletProduct,
      this.weightBoxProduct,
      this.weightPalletProduct,
      this.createdAt,
      this.updatedAt,
      this.remainUnits,
      this.reorderPoint,
      this.branchRemainUnits,
      this.estimateTime,
      required this.price})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        modelProduct, 'Product', 'modelProduct');
    BuiltValueNullFieldError.checkNotNull(price, 'Product', 'price');
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
        modelProduct == other.modelProduct &&
        descriptionProduct == other.descriptionProduct &&
        urlImageProduct == other.urlImageProduct &&
        formatProduct == other.formatProduct &&
        codeProduct == other.codeProduct &&
        familyProduct == other.familyProduct &&
        finishProduct == other.finishProduct &&
        brandProduct == other.brandProduct &&
        originProduct == other.originProduct &&
        unitMeasureProduct == other.unitMeasureProduct &&
        unitsBoxProduct == other.unitsBoxProduct &&
        areaBoxProduct == other.areaBoxProduct &&
        boxesPalletProduct == other.boxesPalletProduct &&
        areaPalletProduct == other.areaPalletProduct &&
        weightBoxProduct == other.weightBoxProduct &&
        weightPalletProduct == other.weightPalletProduct &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        remainUnits == other.remainUnits &&
        reorderPoint == other.reorderPoint &&
        branchRemainUnits == other.branchRemainUnits &&
        estimateTime == other.estimateTime &&
        price == other.price;
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
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc(0, id.hashCode), modelProduct.hashCode), descriptionProduct.hashCode), urlImageProduct.hashCode), formatProduct.hashCode),
                                                                                codeProduct.hashCode),
                                                                            familyProduct.hashCode),
                                                                        finishProduct.hashCode),
                                                                    brandProduct.hashCode),
                                                                originProduct.hashCode),
                                                            unitMeasureProduct.hashCode),
                                                        unitsBoxProduct.hashCode),
                                                    areaBoxProduct.hashCode),
                                                boxesPalletProduct.hashCode),
                                            areaPalletProduct.hashCode),
                                        weightBoxProduct.hashCode),
                                    weightPalletProduct.hashCode),
                                createdAt.hashCode),
                            updatedAt.hashCode),
                        remainUnits.hashCode),
                    reorderPoint.hashCode),
                branchRemainUnits.hashCode),
            estimateTime.hashCode),
        price.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Product')
          ..add('id', id)
          ..add('modelProduct', modelProduct)
          ..add('descriptionProduct', descriptionProduct)
          ..add('urlImageProduct', urlImageProduct)
          ..add('formatProduct', formatProduct)
          ..add('codeProduct', codeProduct)
          ..add('familyProduct', familyProduct)
          ..add('finishProduct', finishProduct)
          ..add('brandProduct', brandProduct)
          ..add('originProduct', originProduct)
          ..add('unitMeasureProduct', unitMeasureProduct)
          ..add('unitsBoxProduct', unitsBoxProduct)
          ..add('areaBoxProduct', areaBoxProduct)
          ..add('boxesPalletProduct', boxesPalletProduct)
          ..add('areaPalletProduct', areaPalletProduct)
          ..add('weightBoxProduct', weightBoxProduct)
          ..add('weightPalletProduct', weightPalletProduct)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('remainUnits', remainUnits)
          ..add('reorderPoint', reorderPoint)
          ..add('branchRemainUnits', branchRemainUnits)
          ..add('estimateTime', estimateTime)
          ..add('price', price))
        .toString();
  }
}

class ProductBuilder implements Builder<Product, ProductBuilder> {
  _$Product? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _modelProduct;
  String? get modelProduct => _$this._modelProduct;
  set modelProduct(String? modelProduct) => _$this._modelProduct = modelProduct;

  String? _descriptionProduct;
  String? get descriptionProduct => _$this._descriptionProduct;
  set descriptionProduct(String? descriptionProduct) =>
      _$this._descriptionProduct = descriptionProduct;

  String? _urlImageProduct;
  String? get urlImageProduct => _$this._urlImageProduct;
  set urlImageProduct(String? urlImageProduct) =>
      _$this._urlImageProduct = urlImageProduct;

  String? _formatProduct;
  String? get formatProduct => _$this._formatProduct;
  set formatProduct(String? formatProduct) =>
      _$this._formatProduct = formatProduct;

  String? _codeProduct;
  String? get codeProduct => _$this._codeProduct;
  set codeProduct(String? codeProduct) => _$this._codeProduct = codeProduct;

  String? _familyProduct;
  String? get familyProduct => _$this._familyProduct;
  set familyProduct(String? familyProduct) =>
      _$this._familyProduct = familyProduct;

  String? _finishProduct;
  String? get finishProduct => _$this._finishProduct;
  set finishProduct(String? finishProduct) =>
      _$this._finishProduct = finishProduct;

  String? _brandProduct;
  String? get brandProduct => _$this._brandProduct;
  set brandProduct(String? brandProduct) => _$this._brandProduct = brandProduct;

  String? _originProduct;
  String? get originProduct => _$this._originProduct;
  set originProduct(String? originProduct) =>
      _$this._originProduct = originProduct;

  String? _unitMeasureProduct;
  String? get unitMeasureProduct => _$this._unitMeasureProduct;
  set unitMeasureProduct(String? unitMeasureProduct) =>
      _$this._unitMeasureProduct = unitMeasureProduct;

  int? _unitsBoxProduct;
  int? get unitsBoxProduct => _$this._unitsBoxProduct;
  set unitsBoxProduct(int? unitsBoxProduct) =>
      _$this._unitsBoxProduct = unitsBoxProduct;

  double? _areaBoxProduct;
  double? get areaBoxProduct => _$this._areaBoxProduct;
  set areaBoxProduct(double? areaBoxProduct) =>
      _$this._areaBoxProduct = areaBoxProduct;

  int? _boxesPalletProduct;
  int? get boxesPalletProduct => _$this._boxesPalletProduct;
  set boxesPalletProduct(int? boxesPalletProduct) =>
      _$this._boxesPalletProduct = boxesPalletProduct;

  double? _areaPalletProduct;
  double? get areaPalletProduct => _$this._areaPalletProduct;
  set areaPalletProduct(double? areaPalletProduct) =>
      _$this._areaPalletProduct = areaPalletProduct;

  double? _weightBoxProduct;
  double? get weightBoxProduct => _$this._weightBoxProduct;
  set weightBoxProduct(double? weightBoxProduct) =>
      _$this._weightBoxProduct = weightBoxProduct;

  double? _weightPalletProduct;
  double? get weightPalletProduct => _$this._weightPalletProduct;
  set weightPalletProduct(double? weightPalletProduct) =>
      _$this._weightPalletProduct = weightPalletProduct;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  int? _remainUnits;
  int? get remainUnits => _$this._remainUnits;
  set remainUnits(int? remainUnits) => _$this._remainUnits = remainUnits;

  int? _reorderPoint;
  int? get reorderPoint => _$this._reorderPoint;
  set reorderPoint(int? reorderPoint) => _$this._reorderPoint = reorderPoint;

  int? _branchRemainUnits;
  int? get branchRemainUnits => _$this._branchRemainUnits;
  set branchRemainUnits(int? branchRemainUnits) =>
      _$this._branchRemainUnits = branchRemainUnits;

  int? _estimateTime;
  int? get estimateTime => _$this._estimateTime;
  set estimateTime(int? estimateTime) => _$this._estimateTime = estimateTime;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  ProductBuilder();

  ProductBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _modelProduct = $v.modelProduct;
      _descriptionProduct = $v.descriptionProduct;
      _urlImageProduct = $v.urlImageProduct;
      _formatProduct = $v.formatProduct;
      _codeProduct = $v.codeProduct;
      _familyProduct = $v.familyProduct;
      _finishProduct = $v.finishProduct;
      _brandProduct = $v.brandProduct;
      _originProduct = $v.originProduct;
      _unitMeasureProduct = $v.unitMeasureProduct;
      _unitsBoxProduct = $v.unitsBoxProduct;
      _areaBoxProduct = $v.areaBoxProduct;
      _boxesPalletProduct = $v.boxesPalletProduct;
      _areaPalletProduct = $v.areaPalletProduct;
      _weightBoxProduct = $v.weightBoxProduct;
      _weightPalletProduct = $v.weightPalletProduct;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _remainUnits = $v.remainUnits;
      _reorderPoint = $v.reorderPoint;
      _branchRemainUnits = $v.branchRemainUnits;
      _estimateTime = $v.estimateTime;
      _price = $v.price;
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
            modelProduct: BuiltValueNullFieldError.checkNotNull(
                modelProduct, 'Product', 'modelProduct'),
            descriptionProduct: descriptionProduct,
            urlImageProduct: urlImageProduct,
            formatProduct: formatProduct,
            codeProduct: codeProduct,
            familyProduct: familyProduct,
            finishProduct: finishProduct,
            brandProduct: brandProduct,
            originProduct: originProduct,
            unitMeasureProduct: unitMeasureProduct,
            unitsBoxProduct: unitsBoxProduct,
            areaBoxProduct: areaBoxProduct,
            boxesPalletProduct: boxesPalletProduct,
            areaPalletProduct: areaPalletProduct,
            weightBoxProduct: weightBoxProduct,
            weightPalletProduct: weightPalletProduct,
            createdAt: createdAt,
            updatedAt: updatedAt,
            remainUnits: remainUnits,
            reorderPoint: reorderPoint,
            branchRemainUnits: branchRemainUnits,
            estimateTime: estimateTime,
            price: BuiltValueNullFieldError.checkNotNull(
                price, 'Product', 'price'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
