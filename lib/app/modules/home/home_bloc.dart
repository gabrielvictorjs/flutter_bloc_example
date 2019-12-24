import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/models/todo_model.dart';
import '../../data/repositories/todo_repository.dart';

class HomeBloc extends BlocBase {
  final TodoRepository todoRepository;
  // final AuthService authService;

  HomeBloc({@required this.todoRepository});

  final _todosController = BehaviorSubject<List<TodoModel>>();
  Observable<List<TodoModel>> get outTodos => _todosController.stream;

  void loadTodos() async {
    List<TodoModel> todos = await todoRepository.fetch();
    _todosController.add(todos);
  }

  @override
  void dispose() {
    _todosController.close();
    super.dispose();
  }
}
