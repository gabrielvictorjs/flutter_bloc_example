import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

import '../../data/models/todo_model.dart';
import '../../data/models/user_model.dart';
import '../../data/services/auth_service.dart';

class OtherBloc extends BlocBase {
  AuthService _authService;

  OtherBloc({@required AuthService authService}) : _authService = authService;

  final _todoController = BehaviorSubject<TodoModel>();
  Observable<TodoModel> get outTodo => _todoController.stream;
  Sink<TodoModel> get inTodo => _todoController.sink;

  void printUser() async {
    UserModel user = await _authService?.currentUser;
    print(user?.name);
  }

  @override
  void dispose() {
    _todoController.close();
    super.dispose();
  }
}
