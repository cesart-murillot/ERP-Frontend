import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:erp_fronted/src/models/serializers.dart';

String objectToString<T>(final T object, Serializer serializer){
  final Object? objectSerialized = standardSerializers.serializeWith(serializer, object);
  final String objectString = jsonEncode(objectSerialized);

  return objectString;
}

T parseObject<T>(final String objectString, Serializer serializer){
  final parsedObject = jsonDecode(objectString);
  T object = standardSerializers.deserializeWith(serializer, parsedObject);
  return object;
}