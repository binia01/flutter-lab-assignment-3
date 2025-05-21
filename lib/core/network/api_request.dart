import 'package:http/http.dart' as http;
import 'package:music_app/core/errors/app_errors.dart';

class ApiService {
  final http.Client apiService;

  ApiService(this.apiService);

  Future<http.Response> getRequest(String baseApi) async {
    final response = await apiService.get(Uri.parse(baseApi));
    if (response.statusCode == 200) {
      return response;
    }
    throw ServerException();
  }
}
