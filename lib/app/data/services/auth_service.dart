import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

import '../models/user_model.dart';

class AuthService extends Disposable {
  AuthService() {
    print("instanciou");
  }
  
  final _userController = BehaviorSubject<UserModel>();
  Observable<UserModel> get currentUserState => _userController.stream;
  UserModel get currentUser => _userController.value;

  void signIn() {
    _userController.add(
      UserModel(
        uid: "KaslKOEWKldakslKOASd",
        name: "Gabriel Victor",
        email: "dester.gvpdv@email.com",
      ),
    );
  }

  void signOut() {
    _userController.add(null);
  }

  @override
  void dispose() {
    print("saiu");
    _userController.close();
  }
}
