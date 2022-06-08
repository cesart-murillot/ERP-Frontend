import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'section_model.g.dart';

abstract class Section implements Built<Section, SectionBuilder> {
  static Serializer<Section> get serializer => _$sectionSerializer;

  int get id;

  @BuiltValueField(wireName: 'name_section')
  String get nameSection;

  Section._();
  factory Section([void Function(SectionBuilder) updates]) = _$Section;
}