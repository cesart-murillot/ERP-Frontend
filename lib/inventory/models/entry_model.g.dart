// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Entries> _$entriesSerializer = new _$EntriesSerializer();
Serializer<Entry> _$entrySerializer = new _$EntrySerializer();

class _$EntriesSerializer implements StructuredSerializer<Entries> {
  @override
  final Iterable<Type> types = const [Entries, _$Entries];
  @override
  final String wireName = 'Entries';

  @override
  Iterable<Object?> serialize(Serializers serializers, Entries object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'entries',
      serializers.serialize(object.entries,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Entry)])),
    ];

    return result;
  }

  @override
  Entries deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'entries':
          result.entries.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Entry)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$EntrySerializer implements StructuredSerializer<Entry> {
  @override
  final Iterable<Type> types = const [Entry, _$Entry];
  @override
  final String wireName = 'Entry';

  @override
  Iterable<Object?> serialize(Serializers serializers, Entry object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'quantity_entry',
      serializers.serialize(object.quantityEntry,
          specifiedType: const FullType(int)),
      'verified_entry',
      serializers.serialize(object.verifiedEntry,
          specifiedType: const FullType(bool)),
      'error_entry',
      serializers.serialize(object.errorEntry,
          specifiedType: const FullType(bool)),
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
    value = object.supplierEntry;
    if (value != null) {
      result
        ..add('supplier_entry')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.noteEntry;
    if (value != null) {
      result
        ..add('note_entry')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.deletedAt;
    if (value != null) {
      result
        ..add('deleted_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  Entry deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EntryBuilder();

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
        case 'quantity_entry':
          result.quantityEntry = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'supplier_entry':
          result.supplierEntry = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'note_entry':
          result.noteEntry = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'verified_entry':
          result.verifiedEntry = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'error_entry':
          result.errorEntry = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'product_id':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'deleted_at':
          result.deletedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$Entries extends Entries {
  @override
  final BuiltList<Entry> entries;

  factory _$Entries([void Function(EntriesBuilder)? updates]) =>
      (new EntriesBuilder()..update(updates))._build();

  _$Entries._({required this.entries}) : super._() {
    BuiltValueNullFieldError.checkNotNull(entries, 'Entries', 'entries');
  }

  @override
  Entries rebuild(void Function(EntriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntriesBuilder toBuilder() => new EntriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Entries && entries == other.entries;
  }

  @override
  int get hashCode {
    return $jf($jc(0, entries.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Entries')..add('entries', entries))
        .toString();
  }
}

class EntriesBuilder implements Builder<Entries, EntriesBuilder> {
  _$Entries? _$v;

  ListBuilder<Entry>? _entries;
  ListBuilder<Entry> get entries =>
      _$this._entries ??= new ListBuilder<Entry>();
  set entries(ListBuilder<Entry>? entries) => _$this._entries = entries;

  EntriesBuilder();

  EntriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _entries = $v.entries.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Entries other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Entries;
  }

  @override
  void update(void Function(EntriesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Entries build() => _build();

  _$Entries _build() {
    _$Entries _$result;
    try {
      _$result = _$v ?? new _$Entries._(entries: entries.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'entries';
        entries.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Entries', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Entry extends Entry {
  @override
  final int? id;
  @override
  final int quantityEntry;
  @override
  final String? supplierEntry;
  @override
  final String? noteEntry;
  @override
  final bool verifiedEntry;
  @override
  final bool errorEntry;
  @override
  final int productId;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? deletedAt;
  @override
  final Product? product;

  factory _$Entry([void Function(EntryBuilder)? updates]) =>
      (new EntryBuilder()..update(updates))._build();

  _$Entry._(
      {this.id,
      required this.quantityEntry,
      this.supplierEntry,
      this.noteEntry,
      required this.verifiedEntry,
      required this.errorEntry,
      required this.productId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.product})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        quantityEntry, 'Entry', 'quantityEntry');
    BuiltValueNullFieldError.checkNotNull(
        verifiedEntry, 'Entry', 'verifiedEntry');
    BuiltValueNullFieldError.checkNotNull(errorEntry, 'Entry', 'errorEntry');
    BuiltValueNullFieldError.checkNotNull(productId, 'Entry', 'productId');
  }

  @override
  Entry rebuild(void Function(EntryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EntryBuilder toBuilder() => new EntryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Entry &&
        id == other.id &&
        quantityEntry == other.quantityEntry &&
        supplierEntry == other.supplierEntry &&
        noteEntry == other.noteEntry &&
        verifiedEntry == other.verifiedEntry &&
        errorEntry == other.errorEntry &&
        productId == other.productId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        deletedAt == other.deletedAt &&
        product == other.product;
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
                                        $jc($jc(0, id.hashCode),
                                            quantityEntry.hashCode),
                                        supplierEntry.hashCode),
                                    noteEntry.hashCode),
                                verifiedEntry.hashCode),
                            errorEntry.hashCode),
                        productId.hashCode),
                    createdAt.hashCode),
                updatedAt.hashCode),
            deletedAt.hashCode),
        product.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Entry')
          ..add('id', id)
          ..add('quantityEntry', quantityEntry)
          ..add('supplierEntry', supplierEntry)
          ..add('noteEntry', noteEntry)
          ..add('verifiedEntry', verifiedEntry)
          ..add('errorEntry', errorEntry)
          ..add('productId', productId)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('deletedAt', deletedAt)
          ..add('product', product))
        .toString();
  }
}

class EntryBuilder implements Builder<Entry, EntryBuilder> {
  _$Entry? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _quantityEntry;
  int? get quantityEntry => _$this._quantityEntry;
  set quantityEntry(int? quantityEntry) =>
      _$this._quantityEntry = quantityEntry;

  String? _supplierEntry;
  String? get supplierEntry => _$this._supplierEntry;
  set supplierEntry(String? supplierEntry) =>
      _$this._supplierEntry = supplierEntry;

  String? _noteEntry;
  String? get noteEntry => _$this._noteEntry;
  set noteEntry(String? noteEntry) => _$this._noteEntry = noteEntry;

  bool? _verifiedEntry;
  bool? get verifiedEntry => _$this._verifiedEntry;
  set verifiedEntry(bool? verifiedEntry) =>
      _$this._verifiedEntry = verifiedEntry;

  bool? _errorEntry;
  bool? get errorEntry => _$this._errorEntry;
  set errorEntry(bool? errorEntry) => _$this._errorEntry = errorEntry;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  String? _deletedAt;
  String? get deletedAt => _$this._deletedAt;
  set deletedAt(String? deletedAt) => _$this._deletedAt = deletedAt;

  ProductBuilder? _product;
  ProductBuilder get product => _$this._product ??= new ProductBuilder();
  set product(ProductBuilder? product) => _$this._product = product;

  EntryBuilder();

  EntryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _quantityEntry = $v.quantityEntry;
      _supplierEntry = $v.supplierEntry;
      _noteEntry = $v.noteEntry;
      _verifiedEntry = $v.verifiedEntry;
      _errorEntry = $v.errorEntry;
      _productId = $v.productId;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _deletedAt = $v.deletedAt;
      _product = $v.product?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Entry other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Entry;
  }

  @override
  void update(void Function(EntryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Entry build() => _build();

  _$Entry _build() {
    _$Entry _$result;
    try {
      _$result = _$v ??
          new _$Entry._(
              id: id,
              quantityEntry: BuiltValueNullFieldError.checkNotNull(
                  quantityEntry, 'Entry', 'quantityEntry'),
              supplierEntry: supplierEntry,
              noteEntry: noteEntry,
              verifiedEntry: BuiltValueNullFieldError.checkNotNull(
                  verifiedEntry, 'Entry', 'verifiedEntry'),
              errorEntry: BuiltValueNullFieldError.checkNotNull(
                  errorEntry, 'Entry', 'errorEntry'),
              productId: BuiltValueNullFieldError.checkNotNull(
                  productId, 'Entry', 'productId'),
              createdAt: createdAt,
              updatedAt: updatedAt,
              deletedAt: deletedAt,
              product: _product?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'product';
        _product?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Entry', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
