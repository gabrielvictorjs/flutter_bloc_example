part of 'products_bloc.dart';


abstract class ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  ProductsLoaded(this.products);
}

class ProductsFailure extends ProductsState {
  final String error;

  ProductsFailure(this.error);
}
