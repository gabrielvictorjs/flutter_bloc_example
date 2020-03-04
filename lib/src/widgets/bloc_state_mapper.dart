import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Maps bloc state to widget.
class BlocStateMapper<B extends Bloc<dynamic, S>, S> extends StatelessWidget {
  final B bloc;
  final Map<Type, Widget Function(S)> statesToWidgets;

  const BlocStateMapper({Key key, this.bloc, @required this.statesToWidgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      bloc: bloc,
      builder: (_, state) {
        final builder = statesToWidgets[state.runtimeType];
        if (builder != null) {
          return builder(state);
        } else {
          return Container();
        }
      },
    );
  }
}
