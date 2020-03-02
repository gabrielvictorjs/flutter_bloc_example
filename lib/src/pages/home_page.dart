import 'package:features_testing/src/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome!")),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () => Get.toNamed(Routes.reorderable),
            title: Text("Reorderable List"),
            subtitle: Text("Testing how reorderable list works"),
          ),
        ],
      ),
    );
  }
}
