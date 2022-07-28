import 'package:erp_fronted/product_request/request_product/request_product_bloc.dart';
import 'package:erp_fronted/product_request/request_product/request_product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_dropdown_cubit.dart';
import 'product_dropdown_state.dart';

class ProductDropdownPage extends StatelessWidget {
  const ProductDropdownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductDropdownCubit()..populateProductDropdown(),
      child: Builder(builder: (context) => const ProductDropdown()),
    );
  }
}

class ProductDropdown extends StatelessWidget {
  const ProductDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDropdownCubit, ProductDropdownState>(
      builder: (context, state) {
        return DropdownButtonFormField(
          icon: const Icon(
            Icons.arrow_drop_down,
          ),
          onSaved: (value) {
            if (value is List<int>) {
              context.read<RequestProductBloc>().add(AddProductEvent(int.parse(value[0].toString())));
            }
          },
          decoration: const InputDecoration(
            labelText: 'Producto',
            border: OutlineInputBorder(),
          ),
          items: state.productItems,
          onChanged: (value){
          },
        );
      },
    );
  }
}



