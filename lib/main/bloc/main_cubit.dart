import 'package:bloc/bloc.dart';
import 'package:erp_fronted/product/views/product_page.dart';
import 'package:flutter/material.dart';

class MainCubit extends Cubit<Widget> {
  MainCubit() : super(const Text('Adios'));

  void productPage(String page) {
    if (page == 'product') {
      print('Son iguales!!!');
    }
    print(page);
    if (page == 'product') {
      return emit(const ProductPageNavigator());
    }
    return emit(const Text('No page'));
  }

  Widget changeTitle() {
    return const Text('Bloc from another place');
  }
}

class TitleCubit extends Cubit<Widget> {
  TitleCubit() : super(const Text('Title'));

  void titleProductPage(String titlePage) {
    print('title product page');

    if (titlePage == 'product'){
      return emit(const Text('Productos'));
    }

    return emit(const Text('No title'));

  }
}
