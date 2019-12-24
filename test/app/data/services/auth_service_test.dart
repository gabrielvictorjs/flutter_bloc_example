import 'package:features_testing/app/data/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AuthService service;

  setUp(() {
    service = AuthService();
  });

  group('AuthService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<AuthService>());
    });
  });
}
