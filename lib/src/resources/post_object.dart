import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String> postDataToApi(final Uri url, String objectString) async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.get('token');

  http.Response response;
  response = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: objectString);

  if (response.statusCode == 200) {
    return response.body;
  }
  throw Exception(response.body);
}
