import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> fetchTodo() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/todos/1'); // 示例 API 地址，可以根据实际需要修改
      return response;
    } catch (error) {
      throw Exception('Failed to fetch data: $error');
    }
  }

  //第二个接口
  Future<Response> login() async {
    return await _dio.get('http://www.b');
  }


  //第三个接口
  Future<Response> getPostData() async {
    return await _dio.post('/user');
  }


  //其他接口...
}
