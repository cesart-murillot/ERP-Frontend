/*
import 'package:erp_fronted/src/models/product_model.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class ProductsBloc {
  final _repository = Repository();
  final _productsFetcher = PublishSubject<ProductData?>();

  Stream<ProductData?> get data => _productsFetcher.stream;

  fetchProductData() async {
    ProductData? productData = await _repository.fetchProductList();
    _productsFetcher.sink.add(productData);
  }

  dispose() {
    _productsFetcher.close();
  }
}

final bloc = ProductsBloc();*/
