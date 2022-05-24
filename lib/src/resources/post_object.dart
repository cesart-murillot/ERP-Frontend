import 'package:built_value/serializer.dart';
import 'package:erp_fronted/src/resources/generic_serializer.dart';
import 'package:http/http.dart' as http;

Future<String> postDataToApi(final Uri url, String objectString) async {
  http.Response response;
  response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: objectString);

  if (response.statusCode == 200) {
    return response.body;
  }
  throw Exception(response.body);
}
