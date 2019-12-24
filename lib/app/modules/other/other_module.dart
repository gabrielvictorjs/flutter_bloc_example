import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/other_repository.dart';
import '../../data/services/auth_service.dart';
import 'other_args.dart';
import 'other_bloc.dart';
import 'other_page.dart';

class OtherModule extends ModuleWidget {
  final OtherArgs args;

  OtherModule({this.args});

  @override
  List<Bloc> get blocs => [
        Bloc((i) => OtherBloc(authService: i.get())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => OtherRepository()),
        Dependency((i) => AuthService()),
      ];

  @override
  Widget get view => OtherPage(args: args);

  static Inject get to => Inject<OtherModule>.of();
}
