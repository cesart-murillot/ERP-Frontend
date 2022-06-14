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
      'product_id',
      serializers.serialize(object.productId,
          specifiedType: const FullType(int)),
      'section_id',
      serializers.serialize(object.sectionId,
          specifiedType: const FullType(int)),
      'entry_order_products_id',
      serializers.serialize(object.entryOrderProductId,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.remainEntry;
    if (value != null) {
      result
        ..add('remain_entry')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.section;
    if (value != null) {
      result
        ..add('section')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Section)));
    }
    value = object.entryOrderProduct;
    if (value != null) {
      result
        ..add('entry_order_products')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(EntryOrderProduct)));
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
        case 'quantity_entry':
          result.quantityEntry = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'remain_entry':
          result.remainEntry = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'product_id':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'section_id':
          result.sectionId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'entry_order_products_id':
          result.entryOrderProductId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'section':
          result.section.replace(serializers.deserialize(value,
              specifiedType: const FullType(Section))! as Section);
          break;
        case 'entry_order_products':
          result.entryOrderProduct.replace(serializers.deserialize(value,
                  specifiedType: const FullType(EntryOrderProduct))!
              as EntryOrderProduct);
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
  final int quantityEntry;
  @override
  final int? remainEntry;
  @override
  final int productId;
  @override
  final int sectionId;
  @override
  final String? createdAt;
  @override
  final int entryOrderProductId;
  @override
  final Section? section;
  @override
  final EntryOrderProduct? entryOrderProduct;

  factory _$Entry([void Function(EntryBuilder)? updates]) =>
      (new EntryBuilder()..update(updates))._build();

  _$Entry._(
      {required this.quantityEntry,
      this.remainEntry,
      required this.productId,
      required this.sectionId,
      this.createdAt,
      required this.entryOrderProductId,
      this.section,
      this.entryOrderProduct})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        quantityEntry, 'Entry', 'quantityEntry');
    BuiltValueNullFieldError.checkNotNull(productId, 'Entry', 'productId');
    BuiltValueNullFieldError.checkNotNull(sectionId, 'Entry', 'sectionId');
    BuiltValueNullFieldError.checkNotNull(
        entryOrderProductId, 'Entry', 'entryOrderProductId');
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
        quantityEntry == other.quantityEntry &&
        remainEntry == other.remainEntry &&
        productId == other.productId &&
        sectionId == other.sectionId &&
        createdAt == other.createdAt &&
        entryOrderProductId == other.entryOrderProductId &&
        section == other.section &&
        entryOrderProduct == other.entryOrderProduct;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, quantityEntry.hashCode),
                                remainEntry.hashCode),
                            productId.hashCode),
                        sectionId.hashCode),
                    createdAt.hashCode),
                entryOrderProductId.hashCode),
            section.hashCode),
        entryOrderProduct.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Entry')
          ..add('quantityEntry', quantityEntry)
          ..add('remainEntry', remainEntry)
          ..add('productId', productId)
          ..add('sectionId', sectionId)
          ..add('createdAt', createdAt)
          ..add('entryOrderProductId', entryOrderProductId)
          ..add('section', section)
          ..add('entryOrderProduct', entryOrderProduct))
        .toString();
  }
}

class EntryBuilder implements Builder<Entry, EntryBuilder> {
  _$Entry? _$v;

  int? _quantityEntry;
  int? get quantityEntry => _$this._quantityEntry;
  set quantityEntry(int? quantityEntry) =>
      _$this._quantityEntry = quantityEntry;

  int? _remainEntry;
  int? get remainEntry => _$this._remainEntry;
  set remainEntry(int? remainEntry) => _$this._remainEntry = remainEntry;

  int? _productId;
  int? get productId => _$this._productId;
  set productId(int? productId) => _$this._productId = productId;

  int? _sectionId;
  int? get sectionId => _$this._sectionId;
  set sectionId(int? sectionId) => _$this._sectionId = sectionId;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  int? _entryOrderProductId;
  int? get entryOrderProductId => _$this._entryOrderProductId;
  set entryOrderProductId(int? entryOrderProductId) =>
      _$this._entryOrderProductId = entryOrderProductId;

  SectionBuilder? _section;
  SectionBuilder get section => _$this._section ??= new SectionBuilder();
  set section(SectionBuilder? section) => _$this._section = section;

  EntryOrderProductBuilder? _entryOrderProduct;
  EntryOrderProductBuilder get entryOrderProduct =>
      _$this._entryOrderProduct ??= new EntryOrderProductBuilder();
  set entryOrderProduct(EntryOrderProductBuilder? entryOrderProduct) =>
      _$this._entryOrderProduct = entryOrderProduct;

  EntryBuilder();

  EntryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _quantityEntry = $v.quantityEntry;
      _remainEntry = $v.remainEntry;
      _productId = $v.productId;
      _sectionId = $v.sectionId;
      _createdAt = $v.createdAt;
      _entryOrderProductId = $v.entryOrderProductId;
      _section = $v.section?.toBuilder();
      _entryOrderProduct = $v.entryOrderProduct?.toBuilder();
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
              quantityEntry: BuiltValueNullFieldError.checkNotNull(
                  quantityEntry, 'Entry', 'quantityEntry'),
              remainEntry: remainEntry,
              productId: BuiltValueNullFieldError.checkNotNull(
                  productId, 'Entry', 'productId'),
              sectionId: BuiltValueNullFieldError.checkNotNull(
                  sectionId, 'Entry', 'sectionId'),
              createdAt: createdAt,
              entryOrderProductId: BuiltValueNullFieldError.checkNotNull(
                  entryOrderProductId, 'Entry', 'entryOrderProductId'),
              section: _section?.build(),
              entryOrderProduct: _entryOrderProduct?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'section';
        _section?.build();
        _$failedField = 'entryOrderProduct';
        _entryOrderProduct?.build();
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
