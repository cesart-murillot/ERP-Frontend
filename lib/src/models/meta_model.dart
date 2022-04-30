import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'meta_model.g.dart';

abstract class LinkData implements Built<LinkData, LinkDataBuilder> {
  static Serializer<LinkData> get serializer => _$linkDataSerializer;

  String get first;
  String get last;
  String? get prev;
  String? get next;

  LinkData._();
  factory LinkData([void Function(LinkDataBuilder) updates]) = _$LinkData;
}

abstract class MetaData implements Built<MetaData, MetaDataBuilder> {
  static Serializer<MetaData> get serializer => _$metaDataSerializer;

  int get current_page;
  int get from;
  int get last_page;
  BuiltList<NavigationData> get links;
  String get path;
  int get per_page;
  int get to;
  int get total;

  MetaData._();
  factory MetaData([void Function(MetaDataBuilder) updates]) = _$MetaData;
}

abstract class NavigationData implements Built<NavigationData, NavigationDataBuilder> {
  static Serializer<NavigationData> get serializer => _$navigationDataSerializer;

  String? get url;
  String get label;
  bool get active;

  NavigationData._();
  factory NavigationData([void Function(NavigationDataBuilder) updates]) = _$NavigationData;
}