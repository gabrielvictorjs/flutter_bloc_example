import 'dart:async';

import 'package:features_testing/src/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../../blocs/filtered_products/filtered_products_bloc.dart';
import '../../blocs/products/products_bloc.dart';
import 'empty_widget.dart';

class ProductsWidget extends StatefulWidget {
  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  final _productsBloc = sl<ProductsBloc>();
  final _filteredProductsBloc = sl<FilteredProductsBloc>();
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    _productsBloc.listen((state) {
      if (state is ProductsLoaded) {
        _refreshCompleter?.complete();
        _refreshCompleter = Completer();
      }
    });
  }

  Future<void> _onRefresh() {
    _productsBloc.add(ProductsRefreshed());
    return _refreshCompleter.future;
  }

  void _onReorder(int oldIndex, int newIndex) {
    _productsBloc.add(ProductsReordered(oldIndex, newIndex));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredProductsBloc, List<Product>>(
      bloc: _filteredProductsBloc,
      builder: (_, filteredProducts) {
        if (filteredProducts.isEmpty) {
          return EmptyWidget();
        }
        
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: ReorderableListView(
            onReorder: _onReorder,
            children: List.generate(
              filteredProducts.length,
              (index) {
                final product = filteredProducts[index];
                return ListTile(
                  key: ValueKey(product),
                  title: Text(product.title),
                  subtitle: Text(product.description),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
