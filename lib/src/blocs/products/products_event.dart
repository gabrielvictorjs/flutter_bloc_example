part of 'products_bloc.dart';

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
    if (state is ProductsLoaded) {
      Product product = state.products.removeAt(oldIndex);
      state.products.insert(_newIndex, product);
      yield ProductsLoaded(state.products);
    }
  }
}

class ProductsStarted implements ProductsEvent {
  @override
  Stream<ProductsState> execute(
    ProductRepository repository,
    ProductsState state,
  ) async* {
    yield ProductsLoading();
    try {
      final products = await repository.fetch();
      yield ProductsLoaded(products);
    } on String catch (e) {
      yield ProductsFailure(e);
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
      yield ProductsLoaded(products);
    } catch (e) {
      yield state;
    }
  }
}
