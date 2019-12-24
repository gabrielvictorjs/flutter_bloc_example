import 'dart:math';

import 'package:meta/meta.dart';

class UserModel {
  String uid;
  String name;
  String email;

  UserModel({@required this.uid, this.name, this.email});

  Future<String> get token => Future.delayed(Duration(seconds: 2), () {
        return Random().toString();
      });
}
