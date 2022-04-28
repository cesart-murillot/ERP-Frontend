// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_link.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Links> _$linksSerializer = new _$LinksSerializer();
Serializer<Meta> _$metaSerializer = new _$MetaSerializer();
Serializer<Navigation> _$navigationSerializer = new _$NavigationSerializer();

class _$LinksSerializer implements StructuredSerializer<Links> {
  @override
  final Iterable<Type> types = const [Links, _$Links];
  @override
  final String wireName = 'Links';

  @override
  Iterable<Object?> serialize(Serializers serializers, Links object,
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
  Links deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LinksBuilder();

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

class _$MetaSerializer implements StructuredSerializer<Meta> {
  @override
  final Iterable<Type> types = const [Meta, _$Meta];
  @override
  final String wireName = 'Meta';

  @override
  Iterable<Object?> serialize(Serializers serializers, Meta object,
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
          specifiedType:
              const FullType(BuiltList, const [const FullType(Navigation)])),
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
  Meta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MetaBuilder();

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
                      BuiltList, const [const FullType(Navigation)]))!
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

class _$NavigationSerializer implements StructuredSerializer<Navigation> {
  @override
  final Iterable<Type> types = const [Navigation, _$Navigation];
  @override
  final String wireName = 'Navigation';

  @override
  Iterable<Object?> serialize(Serializers serializers, Navigation object,
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
  Navigation deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NavigationBuilder();

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

class _$Links extends Links {
  @override
  final String first;
  @override
  final String last;
  @override
  final String? prev;
  @override
  final String? next;

  factory _$Links([void Function(LinksBuilder)? updates]) =>
      (new LinksBuilder()..update(updates)).build();

  _$Links._({required this.first, required this.last, this.prev, this.next})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(first, 'Links', 'first');
    BuiltValueNullFieldError.checkNotNull(last, 'Links', 'last');
  }

  @override
  Links rebuild(void Function(LinksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LinksBuilder toBuilder() => new LinksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Links &&
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
    return (newBuiltValueToStringHelper('Links')
          ..add('first', first)
          ..add('last', last)
          ..add('prev', prev)
          ..add('next', next))
        .toString();
  }
}

class LinksBuilder implements Builder<Links, LinksBuilder> {
  _$Links? _$v;

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

  LinksBuilder();

  LinksBuilder get _$this {
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
  void replace(Links other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Links;
  }

  @override
  void update(void Function(LinksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Links build() {
    final _$result = _$v ??
        new _$Links._(
            first:
                BuiltValueNullFieldError.checkNotNull(first, 'Links', 'first'),
            last: BuiltValueNullFieldError.checkNotNull(last, 'Links', 'last'),
            prev: prev,
            next: next);
    replace(_$result);
    return _$result;
  }
}

class _$Meta extends Meta {
  @override
  final int current_page;
  @override
  final int from;
  @override
  final int last_page;
  @override
  final BuiltList<Navigation> links;
  @override
  final String path;
  @override
  final int per_page;
  @override
  final int to;
  @override
  final int total;

  factory _$Meta([void Function(MetaBuilder)? updates]) =>
      (new MetaBuilder()..update(updates)).build();

  _$Meta._(
      {required this.current_page,
      required this.from,
      required this.last_page,
      required this.links,
      required this.path,
      required this.per_page,
      required this.to,
      required this.total})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(current_page, 'Meta', 'current_page');
    BuiltValueNullFieldError.checkNotNull(from, 'Meta', 'from');
    BuiltValueNullFieldError.checkNotNull(last_page, 'Meta', 'last_page');
    BuiltValueNullFieldError.checkNotNull(links, 'Meta', 'links');
    BuiltValueNullFieldError.checkNotNull(path, 'Meta', 'path');
    BuiltValueNullFieldError.checkNotNull(per_page, 'Meta', 'per_page');
    BuiltValueNullFieldError.checkNotNull(to, 'Meta', 'to');
    BuiltValueNullFieldError.checkNotNull(total, 'Meta', 'total');
  }

  @override
  Meta rebuild(void Function(MetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MetaBuilder toBuilder() => new MetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Meta &&
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
    return (newBuiltValueToStringHelper('Meta')
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

class MetaBuilder implements Builder<Meta, MetaBuilder> {
  _$Meta? _$v;

  int? _current_page;
  int? get current_page => _$this._current_page;
  set current_page(int? current_page) => _$this._current_page = current_page;

  int? _from;
  int? get from => _$this._from;
  set from(int? from) => _$this._from = from;

  int? _last_page;
  int? get last_page => _$this._last_page;
  set last_page(int? last_page) => _$this._last_page = last_page;

  ListBuilder<Navigation>? _links;
  ListBuilder<Navigation> get links =>
      _$this._links ??= new ListBuilder<Navigation>();
  set links(ListBuilder<Navigation>? links) => _$this._links = links;

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

  MetaBuilder();

  MetaBuilder get _$this {
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
  void replace(Meta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Meta;
  }

  @override
  void update(void Function(MetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Meta build() {
    _$Meta _$result;
    try {
      _$result = _$v ??
          new _$Meta._(
              current_page: BuiltValueNullFieldError.checkNotNull(
                  current_page, 'Meta', 'current_page'),
              from: BuiltValueNullFieldError.checkNotNull(from, 'Meta', 'from'),
              last_page: BuiltValueNullFieldError.checkNotNull(
                  last_page, 'Meta', 'last_page'),
              links: links.build(),
              path: BuiltValueNullFieldError.checkNotNull(path, 'Meta', 'path'),
              per_page: BuiltValueNullFieldError.checkNotNull(
                  per_page, 'Meta', 'per_page'),
              to: BuiltValueNullFieldError.checkNotNull(to, 'Meta', 'to'),
              total: BuiltValueNullFieldError.checkNotNull(
                  total, 'Meta', 'total'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'links';
        links.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Meta', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Navigation extends Navigation {
  @override
  final String? url;
  @override
  final String label;
  @override
  final bool active;

  factory _$Navigation([void Function(NavigationBuilder)? updates]) =>
      (new NavigationBuilder()..update(updates)).build();

  _$Navigation._({this.url, required this.label, required this.active})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(label, 'Navigation', 'label');
    BuiltValueNullFieldError.checkNotNull(active, 'Navigation', 'active');
  }

  @override
  Navigation rebuild(void Function(NavigationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationBuilder toBuilder() => new NavigationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Navigation &&
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
    return (newBuiltValueToStringHelper('Navigation')
          ..add('url', url)
          ..add('label', label)
          ..add('active', active))
        .toString();
  }
}

class NavigationBuilder implements Builder<Navigation, NavigationBuilder> {
  _$Navigation? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  NavigationBuilder();

  NavigationBuilder get _$this {
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
  void replace(Navigation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Navigation;
  }

  @override
  void update(void Function(NavigationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Navigation build() {
    final _$result = _$v ??
        new _$Navigation._(
            url: url,
            label: BuiltValueNullFieldError.checkNotNull(
                label, 'Navigation', 'label'),
            active: BuiltValueNullFieldError.checkNotNull(
                active, 'Navigation', 'active'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
