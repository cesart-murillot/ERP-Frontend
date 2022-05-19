import 'package:erp_fronted/entry_order/register_entry_order/register_entry/register_entry_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_new_product_cubit.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewProductCubit, int>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state,
          itemBuilder: (context, index) {
            return const RegisterEntryPage();
          },
        );
      },
    );
  }
}