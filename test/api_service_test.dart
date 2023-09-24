import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'Todo.dart';// 导入你的数据模型类

void main() {
  group('API Service Tests', () {
    test('Test a successful network request', () async {
      final dio = Dio(); // 创建一个 Dio 实例

      final response = await dio.get('https://jsonplaceholder.typicode.com/todos/1');
      expect(response.statusCode, 200); // 断言状态码为 200

      // 解析 JSON 数据为 Todo 对象
      final todo = Todo.fromJson(response.data);

      // 现在你可以访问解析后的数据并进行断言
      expect(todo.userId, 1);
      expect(todo.id, 1);
      expect(todo.title, 'delectus aut autem');
      expect(todo.completed, false);
    });
  });
}
