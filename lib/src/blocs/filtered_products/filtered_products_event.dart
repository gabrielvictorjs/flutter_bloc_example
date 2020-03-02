part of 'filtered_products_bloc.dart';

@immutable
abstract class FilteredProductsEvent {
  Stream<List<Product>> execute(ProductsBloc productsBloc);
}

class FilteredProductsStarted extends FilteredProductsEvent {
  final List<Product> products;

  FilteredProductsStarted(this.products);

  @override
  Stream<List<Product>> execute(ProductsBloc productsBloc) async* {
    final productState = productsBloc.state as ProductsLoaded;
    yield productState.products;
  }
}

class FilteredProductsChanged extends FilteredProductsEvent {
  final String filter;

  FilteredProductsChanged(this.filter);

  @override
  Stream<List<Product>> execute(ProductsBloc productsBloc) async* {
    if (productsBloc.state is ProductsLoaded) {
      final productState = productsBloc.state as ProductsLoaded;
      final filteredProducts = productState.products.where((item) {
        return item.title.toLowerCase().contains(filter.toLowerCase().trim());
      }).toList();
      yield filter.trim().isEmpty ? productState.products : filteredProducts;
    }
  }
}
