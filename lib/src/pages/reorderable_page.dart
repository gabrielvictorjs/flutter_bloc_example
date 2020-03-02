import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';
import '../blocs/products/bloc.dart';
import '../widgets/products/empty_widget.dart';
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

  @override
  void initState() {
    super.initState();
    _productBloc.add(ProductsStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reorderable")),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        bloc: _productBloc,
        builder: (_, state) {
          return StateMapperWidget<ProductsState>(
            currentState: state,
            statesToWidgets: {
              ProductsEmpty: () => EmptyWidget(),
              ProductsLoadInProgress: () => LoadingWidget(),
              ProductsLoadSuccess: () {
                return ProductsWidget(
                  products: (state as ProductsLoadSuccess).products,
                );
              },
              ProductsLoadFailure: () {
                return FailureWidget(
                  error: (state as ProductsLoadFailure).error,
                );
              },
            },
          );
        },
      ),
    );
  }
}
