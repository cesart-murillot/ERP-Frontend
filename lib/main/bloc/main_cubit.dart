import 'package:bloc/bloc.dart';
import 'package:erp_fronted/inventory/views/inventory_page.dart';
import 'package:erp_fronted/product/views/product_page.dart';
import 'package:flutter/material.dart';

class MainCubit extends Cubit<Widget> {
  MainCubit() : super(const Text('Adios'));

  void switchPage(String page) {

    if (page == 'product') {
      return emit(const ProductPage());
    }

    if (page == 'inventory') {
      return emit(const InventoryPage());
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
