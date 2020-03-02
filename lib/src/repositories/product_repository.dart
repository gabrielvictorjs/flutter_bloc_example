import '../models/product.dart';

class ProductRepository {
  Future<List<Product>> fetch() async {
    await Future.delayed(Duration(seconds: 2));
    // return [];
    // throw "Erro aqui man";
    return [
      Product("Product 1", "Description 1"),
      Product("Product 2", "Description 2"),
      Product("Product 3", "Description 3"),
      Product("Product 4", "Description 4"),
    ];
  }
}
