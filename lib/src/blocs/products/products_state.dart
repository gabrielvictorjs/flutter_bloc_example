import '../../models/product.dart';

abstract class ProductsState {}

class ProductsEmpty extends ProductsState {}

class ProductsLoadInProgress extends ProductsState {}

class ProductsLoadSuccess extends ProductsState {
  final List<Product> products;

  ProductsLoadSuccess(this.products);
}

class ProductsLoadFailure extends ProductsState {
  final String error;

  ProductsLoadFailure(this.error);
}
