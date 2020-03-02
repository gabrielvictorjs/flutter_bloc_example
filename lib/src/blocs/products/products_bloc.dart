import 'package:bloc/bloc.dart';

import '../../repositories/product_repository.dart';
import 'bloc.dart';
import 'products_event.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository repository;

  ProductsBloc(this.repository);

  @override
  ProductsState get initialState => ProductsEmpty();

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    yield* event.execute(repository, state);
  }
}
