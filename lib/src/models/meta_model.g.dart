// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LinkData> _$linkDataSerializer = new _$LinkDataSerializer();
Serializer<MetaData> _$metaDataSerializer = new _$MetaDataSerializer();
Serializer<NavigationData> _$navigationDataSerializer =
    new _$NavigationDataSerializer();

class _$LinkDataSerializer implements StructuredSerializer<LinkData> {
  @override
  final Iterable<Type> types = const [LinkData, _$LinkData];
  @override
  final String wireName = 'LinkData';

  @override
  Iterable<Object?> serialize(Serializers serializers, LinkData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'first',
      serializers.serialize(object.first,
          specifiedType: const FullType(String)),
      'last',
      serializers.serialize(object.last, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.prev;
    if (value != null) {
      result
        ..add('prev')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.next;
    if (value != null) {
      result
        ..add('next')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  LinkData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LinkDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'last':
          result.last = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'prev':
          result.prev = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'next':
          result.next = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$MetaDataSerializer implements StructuredSerializer<MetaData> {
  @override
  final Iterable<Type> types = const [MetaData, _$MetaData];
  @override
  final String wireName = 'MetaData';

  @override
  Iterable<Object?> serialize(Serializers serializers, MetaData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'current_page',
      serializers.serialize(object.current_page,
          specifiedType: const FullType(int)),
      'from',
      serializers.serialize(object.from, specifiedType: const FullType(int)),
      'last_page',
      serializers.serialize(object.last_page,
          specifiedType: const FullType(int)),
      'links',
      serializers.serialize(object.links,
          specifiedType: const FullType(
              BuiltList, const [const FullType(NavigationData)])),
      'path',
      serializers.serialize(object.path, specifiedType: const FullType(String)),
      'per_page',
      serializers.serialize(object.per_page,
          specifiedType: const FullType(int)),
      'to',
      serializers.serialize(object.to, specifiedType: const FullType(int)),
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  MetaData deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MetaDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'current_page':
          result.current_page = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'from':
          result.from = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'last_page':
          result.last_page = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'links':
          result.links.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(NavigationData)]))!
              as BuiltList<Object?>);
          break;
        case 'path':
          result.path = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'per_page':
          result.per_page = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$NavigationDataSerializer
    implements StructuredSerializer<NavigationData> {
  @override
  final Iterable<Type> types = const [NavigationData, _$NavigationData];
  @override
  final String wireName = 'NavigationData';

  @override
  Iterable<Object?> serialize(Serializers serializers, NavigationData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'label',
      serializers.serialize(object.label,
          specifiedType: const FullType(String)),
      'active',
      serializers.serialize(object.active, specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  NavigationData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NavigationDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'label':
          result.label = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$LinkData extends LinkData {
  @override
  final String first;
  @override
  final String last;
  @override
  final String? prev;
  @override
  final String? next;

  factory _$LinkData([void Function(LinkDataBuilder)? updates]) =>
      (new LinkDataBuilder()..update(updates))._build();

  _$LinkData._({required this.first, required this.last, this.prev, this.next})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(first, 'LinkData', 'first');
    BuiltValueNullFieldError.checkNotNull(last, 'LinkData', 'last');
  }

  @override
  LinkData rebuild(void Function(LinkDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LinkDataBuilder toBuilder() => new LinkDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LinkData &&
        first == other.first &&
        last == other.last &&
        prev == other.prev &&
        next == other.next;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, first.hashCode), last.hashCode), prev.hashCode),
        next.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LinkData')
          ..add('first', first)
          ..add('last', last)
          ..add('prev', prev)
          ..add('next', next))
        .toString();
  }
}

class LinkDataBuilder implements Builder<LinkData, LinkDataBuilder> {
  _$LinkData? _$v;

  String? _first;
  String? get first => _$this._first;
  set first(String? first) => _$this._first = first;

  String? _last;
  String? get last => _$this._last;
  set last(String? last) => _$this._last = last;

  String? _prev;
  String? get prev => _$this._prev;
  set prev(String? prev) => _$this._prev = prev;

  String? _next;
  String? get next => _$this._next;
  set next(String? next) => _$this._next = next;

  LinkDataBuilder();

  LinkDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first = $v.first;
      _last = $v.last;
      _prev = $v.prev;
      _next = $v.next;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LinkData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LinkData;
  }

  @override
  void update(void Function(LinkDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LinkData build() => _build();

  _$LinkData _build() {
    final _$result = _$v ??
        new _$LinkData._(
            first: BuiltValueNullFieldError.checkNotNull(
                first, 'LinkData', 'first'),
            last:
                BuiltValueNullFieldError.checkNotNull(last, 'LinkData', 'last'),
            prev: prev,
            next: next);
    replace(_$result);
    return _$result;
  }
}

class _$MetaData extends MetaData {
  @override
  final int current_page;
  @override
  final int from;
  @override
  final int last_page;
  @override
  final BuiltList<NavigationData> links;
  @override
  final String path;
  @override
  final int per_page;
  @override
  final int to;
  @override
  final int total;

  factory _$MetaData([void Function(MetaDataBuilder)? updates]) =>
      (new MetaDataBuilder()..update(updates))._build();

  _$MetaData._(
      {required this.current_page,
      required this.from,
      required this.last_page,
      required this.links,
      required this.path,
      required this.per_page,
      required this.to,
      required this.total})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        current_page, 'MetaData', 'current_page');
    BuiltValueNullFieldError.checkNotNull(from, 'MetaData', 'from');
    BuiltValueNullFieldError.checkNotNull(last_page, 'MetaData', 'last_page');
    BuiltValueNullFieldError.checkNotNull(links, 'MetaData', 'links');
    BuiltValueNullFieldError.checkNotNull(path, 'MetaData', 'path');
    BuiltValueNullFieldError.checkNotNull(per_page, 'MetaData', 'per_page');
    BuiltValueNullFieldError.checkNotNull(to, 'MetaData', 'to');
    BuiltValueNullFieldError.checkNotNull(total, 'MetaData', 'total');
  }

  @override
  MetaData rebuild(void Function(MetaDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MetaDataBuilder toBuilder() => new MetaDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MetaData &&
        current_page == other.current_page &&
        from == other.from &&
        last_page == other.last_page &&
        links == other.links &&
        path == other.path &&
        per_page == other.per_page &&
        to == other.to &&
        total == other.total;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, current_page.hashCode), from.hashCode),
                            last_page.hashCode),
                        links.hashCode),
                    path.hashCode),
                per_page.hashCode),
            to.hashCode),
        total.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MetaData')
          ..add('current_page', current_page)
          ..add('from', from)
          ..add('last_page', last_page)
          ..add('links', links)
          ..add('path', path)
          ..add('per_page', per_page)
          ..add('to', to)
          ..add('total', total))
        .toString();
  }
}

class MetaDataBuilder implements Builder<MetaData, MetaDataBuilder> {
  _$MetaData? _$v;

  int? _current_page;
  int? get current_page => _$this._current_page;
  set current_page(int? current_page) => _$this._current_page = current_page;

  int? _from;
  int? get from => _$this._from;
  set from(int? from) => _$this._from = from;

  int? _last_page;
  int? get last_page => _$this._last_page;
  set last_page(int? last_page) => _$this._last_page = last_page;

  ListBuilder<NavigationData>? _links;
  ListBuilder<NavigationData> get links =>
      _$this._links ??= new ListBuilder<NavigationData>();
  set links(ListBuilder<NavigationData>? links) => _$this._links = links;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  int? _per_page;
  int? get per_page => _$this._per_page;
  set per_page(int? per_page) => _$this._per_page = per_page;

  int? _to;
  int? get to => _$this._to;
  set to(int? to) => _$this._to = to;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  MetaDataBuilder();

  MetaDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _current_page = $v.current_page;
      _from = $v.from;
      _last_page = $v.last_page;
      _links = $v.links.toBuilder();
      _path = $v.path;
      _per_page = $v.per_page;
      _to = $v.to;
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MetaData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MetaData;
  }

  @override
  void update(void Function(MetaDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MetaData build() => _build();

  _$MetaData _build() {
    _$MetaData _$result;
    try {
      _$result = _$v ??
          new _$MetaData._(
              current_page: BuiltValueNullFieldError.checkNotNull(
                  current_page, 'MetaData', 'current_page'),
              from: BuiltValueNullFieldError.checkNotNull(
                  from, 'MetaData', 'from'),
              last_page: BuiltValueNullFieldError.checkNotNull(
                  last_page, 'MetaData', 'last_page'),
              links: links.build(),
              path: BuiltValueNullFieldError.checkNotNull(
                  path, 'MetaData', 'path'),
              per_page: BuiltValueNullFieldError.checkNotNull(
                  per_page, 'MetaData', 'per_page'),
              to: BuiltValueNullFieldError.checkNotNull(to, 'MetaData', 'to'),
              total: BuiltValueNullFieldError.checkNotNull(
                  total, 'MetaData', 'total'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'links';
        links.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MetaData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$NavigationData extends NavigationData {
  @override
  final String? url;
  @override
  final String label;
  @override
  final bool active;

  factory _$NavigationData([void Function(NavigationDataBuilder)? updates]) =>
      (new NavigationDataBuilder()..update(updates))._build();

  _$NavigationData._({this.url, required this.label, required this.active})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(label, 'NavigationData', 'label');
    BuiltValueNullFieldError.checkNotNull(active, 'NavigationData', 'active');
  }

  @override
  NavigationData rebuild(void Function(NavigationDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationDataBuilder toBuilder() =>
      new NavigationDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationData &&
        url == other.url &&
        label == other.label &&
        active == other.active;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, url.hashCode), label.hashCode), active.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavigationData')
          ..add('url', url)
          ..add('label', label)
          ..add('active', active))
        .toString();
  }
}

class NavigationDataBuilder
    implements Builder<NavigationData, NavigationDataBuilder> {
  _$NavigationData? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  NavigationDataBuilder();

  NavigationDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _label = $v.label;
      _active = $v.active;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavigationData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NavigationData;
  }

  @override
  void update(void Function(NavigationDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NavigationData build() => _build();

  _$NavigationData _build() {
    final _$result = _$v ??
        new _$NavigationData._(
            url: url,
            label: BuiltValueNullFieldError.checkNotNull(
                label, 'NavigationData', 'label'),
            active: BuiltValueNullFieldError.checkNotNull(
                active, 'NavigationData', 'active'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
