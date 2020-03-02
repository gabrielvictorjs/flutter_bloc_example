import '../../models/product.dart';
import '../../repositories/product_repository.dart';
import 'bloc.dart';

abstract class ProductsEvent {
  Stream<ProductsState> execute(
    ProductRepository repository,
    ProductsState state,
  );
}

class ProductsReordered implements ProductsEvent {
  final int oldIndex, newIndex;

  ProductsReordered(this.oldIndex, this.newIndex);

  @override
  Stream<ProductsState> execute(
    ProductRepository repository,
    ProductsState state,
  ) async* {
    int _newIndex = newIndex;
    if (newIndex > oldIndex) _newIndex -= 1;
    if (state is ProductsLoadSuccess) {
      Product product = state.products.removeAt(oldIndex);
      state.products.insert(_newIndex, product);
      yield ProductsLoadSuccess(state.products);
    }
  }
}

class ProductsStarted implements ProductsEvent {
  @override
  Stream<ProductsState> execute(
    ProductRepository repository,
    ProductsState state,
  ) async* {
    yield ProductsLoadInProgress();
    try {
      final products = await repository.fetch();
      yield products.isEmpty ? ProductsEmpty() : ProductsLoadSuccess(products);
    } on String catch (e) {
      yield ProductsLoadFailure(e);
    }
  }
}

class ProductsRefreshed implements ProductsEvent {
  @override
  Stream<ProductsState> execute(
    ProductRepository repository,
    ProductsState state,
  ) async* {
    try {
      final products = await repository.fetch();
      yield products.isEmpty ? ProductsEmpty() : ProductsLoadSuccess(products);
    } catch (e) {
      yield state;
    }
  }
}
