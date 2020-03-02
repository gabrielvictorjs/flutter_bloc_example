import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import '../blocs/filtered_products/filtered_products_bloc.dart';
import '../blocs/products/products_bloc.dart';
import '../widgets/products/failure_widget.dart';
import '../widgets/products/loading_widget.dart';
import '../widgets/products/products_widget.dart';
import '../widgets/state_mapper_widget.dart';

class ReorderablePage extends StatefulWidget {
  @override
  _ReorderablePageState createState() => _ReorderablePageState();
}

class _ReorderablePageState extends State<ReorderablePage> {
  final _productBloc = sl<ProductsBloc>();
  final _filteredProductBloc = sl<FilteredProductsBloc>();

  @override
  void initState() {
    super.initState();
    _productBloc.add(ProductsStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reorderable")),
      body: Column(
        children: <Widget>[
          _buildInputSearch(),
          _buildProducts(),
        ],
      ),
    );
  }

  Container _buildInputSearch() {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextField(
        onChanged: (filter) {
          _filteredProductBloc.add(FilteredProductsChanged(filter));
        },
        decoration: InputDecoration(
          hintText: "Search",
        ),
      ),
    );
  }

  Widget _buildProducts() {
    return Expanded(
      child: BlocBuilder<ProductsBloc, ProductsState>(
        bloc: _productBloc,
        builder: (_, state) {
          return StateMapperWidget<ProductsState>(
            currentState: state,
            statesToWidgets: {
              ProductsLoading: () => LoadingWidget(),
              ProductsLoaded: () => ProductsWidget(),
              ProductsFailure: () {
                return FailureWidget(
                  error: (state as ProductsFailure).error,
                );
              },
            },
          );
        },
      ),
    );
  }
}
