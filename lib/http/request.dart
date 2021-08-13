import 'package:http/http.dart' as http;

class Request {
  final String Url;
  final dynamic body;
  final dynamic header;
  Request({required this.Url, this.body, this.header});

  Future<http.Response> post() {
    return http
        .post(Uri.parse(Url), body: body, headers: header)
        .timeout(Duration(minutes: 2));
  }
  Future<http.Response> put() {
    return http
        .put(Uri.parse(Url), body: body, headers: header)
        .timeout(Duration(minutes: 2));
  }

  Future<http.Response> get() {
    return http.get(Uri.parse(Url)).timeout(Duration(minutes: 2));
  }

  Future <http.Response> delete() async{
    var response= await http.delete(Uri.parse(this.Url));
    return response;
  }
}

