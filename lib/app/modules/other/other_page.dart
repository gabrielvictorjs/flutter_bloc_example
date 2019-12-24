import 'package:flutter/material.dart';

import '../../data/models/todo_model.dart';
import 'other_args.dart';
import 'other_bloc.dart';
import 'other_module.dart';

class OtherPage extends StatefulWidget {
  final String title;
  final OtherArgs args;
  const OtherPage({Key key, this.title = "Other", this.args}) : super(key: key);

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  final _otherBloc = OtherModule.to.getBloc<OtherBloc>();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstLoading();
  }

  void _firstLoading() {
    if (widget.args == null) {
      _otherBloc.inTodo.add(TodoModel());
    } else if (widget.args.hasData) {
      _otherBloc.inTodo.add(widget.args.todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<TodoModel>(
        stream: _otherBloc.outTodo,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Todo: ${snapshot.data.id}",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Text(
                    "Todo: ${snapshot.data.title}",
                    style: Theme.of(context).textTheme.subhead,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Todo: ${snapshot.data.completed}",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
