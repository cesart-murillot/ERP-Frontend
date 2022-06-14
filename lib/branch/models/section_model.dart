import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/branch/models/warehouse_model.dart';
part 'section_model.g.dart';

abstract class Section implements Built<Section, SectionBuilder> {
  static Serializer<Section> get serializer => _$sectionSerializer;

  int get id;

  @BuiltValueField(wireName: 'name_section')
  String get nameSection;

  Warehouse? get warehouse;

  Section._();
  factory Section([void Function(SectionBuilder) updates]) = _$Section;
}