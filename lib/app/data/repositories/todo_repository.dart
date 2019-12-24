import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../models/todo_model.dart';

class TodoRepository extends Disposable {
  final Dio dio;

  TodoRepository({@required this.dio});

  Future<List<TodoModel>> fetch() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/todos');

    return (response.data as List)
        .map((todo) => TodoModel.fromJson(todo))
        .toList();
  }

  @override
  void dispose() {}
}
