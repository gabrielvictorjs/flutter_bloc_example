import 'package:features_testing/src/blocs/products/bloc.dart';
import 'package:features_testing/src/repositories/product_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(() => ProductRepository());
  sl.registerLazySingleton(() => ProductsBloc(sl()));
}