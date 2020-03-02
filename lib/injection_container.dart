import 'package:get_it/get_it.dart';

import 'src/blocs/filtered_products/filtered_products_bloc.dart';
import 'src/blocs/products/products_bloc.dart';
import 'src/repositories/product_repository.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton(() => ProductRepository());
  sl.registerLazySingleton(() => ProductsBloc(sl()));
  sl.registerLazySingleton(() => FilteredProductsBloc(sl()));
}