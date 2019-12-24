import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import '../../app_module.dart';
import '../../data/repositories/todo_repository.dart';
import 'home_bloc.dart';
import 'home_page.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc(todoRepository: i.get())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => TodoRepository(dio: AppModule.to.get())),
      ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
