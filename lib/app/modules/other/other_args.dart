import '../../data/models/todo_model.dart';

class OtherArgs {
  String todoId;
  TodoModel todo;

  OtherArgs({this.todo, this.todoId});

  bool get hasData => todo != null;
  bool get hasId => todoId != null;
}
