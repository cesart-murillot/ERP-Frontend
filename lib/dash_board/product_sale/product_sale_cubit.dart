import 'dart:convert';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:bloc/bloc.dart';

import '../../src/resources/get_object.dart';
import 'product_sale_state.dart';

class ProductSaleCubit extends Cubit<ProductSaleState> {
  ProductSaleCubit() : super(const ProductSaleState().init());

  Future<void> soldProductsThisYear() async {
    emit(state.loadedData(state: States.loading));
    final url = preDefinedUri('/api/productSales/soldProducts/', {'period': 'thisYear'});
    try {
      final response = await fetchDataFromApi(url);
      final soldProducts = jsonDecode(response);

      final List<OrdinalSales> ordinalSales = [];

      for (final soldProduct in soldProducts) {
        if (soldProduct['totalIncome'] is String) {
          ordinalSales.add(OrdinalSales(double.parse(soldProduct['totalIncome']), soldProduct['soldQuantity'], soldProduct['productModel']));
        }
      }

      final quantity = charts.Series<OrdinalSales, String>(
        id: 'Cantidad',
        colorFn: (_,__) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.product,
        measureFn: (OrdinalSales sales, _) => sales.quantity,
        data: ordinalSales,
      );

      final income = charts.Series<OrdinalSales, String>(
        id: 'Ingresos',
        colorFn: (_,__) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.product,
        measureFn: (OrdinalSales sales, _) => sales.income,
        data: ordinalSales,
      );

      List<charts.Series<OrdinalSales, String>> listQuantity = [];
      List<charts.Series<OrdinalSales, String>> listIncome = [];
      listQuantity.add(quantity);
      listIncome.add(income);

      emit(state.loadedData(state: States.loaded, quantity: listQuantity, income: listIncome,));

    } catch (e) {
      emit(state.error(errorMessage: e.toString()));
    }
  }
}

class OrdinalSales {
  final String product;
  final double quantity;
  final double income;

  OrdinalSales(this.income, this.quantity, this.product);
}