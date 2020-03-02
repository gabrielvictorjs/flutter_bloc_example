import 'package:flutter/material.dart';

class StateMapperWidget<T> extends StatelessWidget {
  final T currentState;
  final Map<Type, Widget Function()> statesToWidgets;

  const StateMapperWidget({this.statesToWidgets, this.currentState});

  @override
  Widget build(BuildContext context) {
    final builder = statesToWidgets[currentState.runtimeType];
    if (builder != null) {
      return builder();
    } else {
      return Container();
    }
  }
}