import 'package:flutter/material.dart';

import '../../data/models/todo_model.dart';
import '../other/other_args.dart';
import 'home_bloc.dart';
import 'home_module.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  void initState() {
    super.initState();
    _homeBloc.loadTodos();
  }

  void _goToOtherPage(OtherArgs args) {
    Navigator.pushNamed(context, "other", arguments: args);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.gps_fixed),
          ),
        ],
      ),
      body: StreamBuilder<List<TodoModel>>(
        stream: _homeBloc.outTodos,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final _todos = snapshot.data;
          if (_todos.isEmpty) {
            return Center(child: Text("Sem dados!"));
          }

          return ListView.builder(
            itemCount: _todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => _goToOtherPage(OtherArgs(todo: _todos[index])),
                title: Text(_todos[index].title),
                subtitle: Text(_todos[index].completed.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
