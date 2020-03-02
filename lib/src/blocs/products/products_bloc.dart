import 'package:bloc/bloc.dart';

import '../../models/product.dart';
import '../../repositories/product_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository repository;

  ProductsBloc(this.repository);

  @override
  ProductsState get initialState => ProductsLoading();

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    yield* event.execute(repository, state);
  }
}
