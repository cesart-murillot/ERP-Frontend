import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'meta_link.g.dart';

abstract class Links implements Built<Links, LinksBuilder> {
  static Serializer<Links> get serializer => _$linksSerializer;
  String get first;
  String get last;
  String? get prev;
  String? get next;

  Links._();
  factory Links([void Function(LinksBuilder) updates]) = _$Links;
}

abstract class Meta implements Built<Meta, MetaBuilder> {
  static Serializer<Meta> get serializer => _$metaSerializer;
  int get current_page;
  int get from;
  int get last_page;
  BuiltList<Navigation> get links;
  String get path;
  int get per_page;
  int get to;
  int get total;

  Meta._();
  factory Meta([void Function(MetaBuilder) updates]) = _$Meta;
}

abstract class Navigation implements Built<Navigation, NavigationBuilder> {
  static Serializer<Navigation> get serializer => _$navigationSerializer;
  String? get url;
  String get label;
  bool get active;

  Navigation._();
  factory Navigation([void Function(NavigationBuilder) updates]) = _$Navigation;
}