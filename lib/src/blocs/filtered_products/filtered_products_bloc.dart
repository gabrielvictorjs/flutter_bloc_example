import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/product.dart';
import '../products/products_bloc.dart';

part 'filtered_products_event.dart';

class FilteredProductsBloc extends Bloc<FilteredProductsEvent, List<Product>> {
  final ProductsBloc productsBloc;
  StreamSubscription productsSubscription;

  FilteredProductsBloc(this.productsBloc) {
    productsSubscription = productsBloc.listen((state) {
      if (state is ProductsLoaded) {
        add(FilteredProductsStarted(state.products));
      }
    });
  }

  @override
  List<Product> get initialState {
    if (productsBloc.state is! ProductsLoaded) return [];
    return (productsBloc.state as ProductsLoaded).products;
  }

  @override
  Stream<List<Product>> mapEventToState(
    FilteredProductsEvent event,
  ) async* {
    yield* event.execute(productsBloc);
  }

  @override
  Future<void> close() {
    productsSubscription.cancel();
    return super.close();
  }
}
