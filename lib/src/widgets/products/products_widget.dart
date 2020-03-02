import 'dart:async';

import 'package:flutter/material.dart';

import '../../../injection_container.dart';
import '../../blocs/products/bloc.dart';
import '../../models/product.dart';

class ProductsWidget extends StatefulWidget {
  final List<Product> products;

  const ProductsWidget({Key key, this.products}) : super(key: key);

  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  final _productsBloc = sl<ProductsBloc>();
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    _productsBloc.listen((state) {
      if (state is ProductsLoadSuccess) {
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
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ReorderableListView(
        onReorder: _onReorder,
        children: List.generate(
          widget.products.length,
          (index) {
            final product = widget.products[index];
            return ListTile(
              key: ValueKey(product),
              title: Text(product.title),
              subtitle: Text(product.description),
            );
          },
        ),
      ),
    );
  }
}
