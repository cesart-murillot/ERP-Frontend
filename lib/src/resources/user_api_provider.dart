import 'package:http/http.dart' as http;

class UserApiProvider {

  Future<http.Response> loginAttempt(String user) async {
    var url = Uri.http('127.0.0.1:8000', 'login');
    http.Response response;
    response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: user,
    );
    if (response.statusCode == 422) {
      print("no funciono");
    }
    return response;
  }
}