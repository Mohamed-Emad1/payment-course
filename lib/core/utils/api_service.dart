import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> post(
      {required String url,
      required body,
      Map<String, String>? headers,
      required String token,
      String? contentType}) async {
    var response = await _dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: headers ??
            {
              'Authorization': 'Bearer $token',
            },
      ),
    );
    return response;
  }
}
