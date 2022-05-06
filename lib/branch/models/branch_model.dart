import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:erp_fronted/src/models/serializers.dart';

part 'branch_model.g.dart';

abstract class Branch implements Built<Branch, BranchBuilder> {
  static Serializer<Branch> get serializer => _$branchSerializer;

  int? get id;

  @BuiltValueField(wireName: 'name_branch')
  String get nameBranch;

  @BuiltValueField(wireName: 'address_branch')
  String get addressBranch;

  Branch._();
  factory Branch([void Function(BranchBuilder) updates]) = _$Branch;
}

Branch? parseBranch(String branchString) {
  final parsedBranch = jsonDecode(branchString);
  final Branch? branch = standardSerializers.deserializeWith(Branch.serializer, parsedBranch);
  return branch;
}

String? branchObjectToString(final Branch branch) {
  final Object? branchSerialized = standardSerializers.serializeWith(Branch.serializer, branch);
  final branchString = jsonEncode(branchSerialized);

  return branchString;
}
