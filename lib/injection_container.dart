import 'package:dio/dio.dart';
import 'package:features_testing/src/blocs/posts/posts_bloc.dart';
import 'package:features_testing/src/repositories/post_repository.dart';
import 'package:get_it/get_it.dart';

import 'src/blocs/filtered_products/filtered_products_bloc.dart';
import 'src/blocs/products/products_bloc.dart';
import 'src/configs/api_client.dart';
import 'src/repositories/product_repository.dart';

final sl = GetIt.instance;

void init() {
  // Preset
  sl.registerLazySingleton<Dio>(() => ApiClient.get());

  // Reorderable list injects
  sl.registerLazySingleton(() => ProductRepository());
  sl.registerLazySingleton(() => ProductsBloc(sl()));
  sl.registerLazySingleton(() => FilteredProductsBloc(sl()));
  
  // Dio posts injects
  sl.registerLazySingleton(() => PostRepository(sl()));
  sl.registerLazySingleton(() => PostsBloc(sl()));
}