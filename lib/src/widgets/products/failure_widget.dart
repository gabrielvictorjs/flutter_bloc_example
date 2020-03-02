import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final String error;

  const FailureWidget({Key key, this.error}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Has $error!"),
    );
  }
}