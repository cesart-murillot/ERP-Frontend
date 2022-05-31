import 'package:erp_fronted/entry_order/register_entry_order/register_entry_order_bloc.dart';
import 'package:erp_fronted/src/resources/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register_entry_order_event.dart';
import 'get_product_list_cubit.dart';
import 'get_product_list_state.dart';

class GetProductListPage extends StatelessWidget {
  const GetProductListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => GetProductListCubit()..getProduct()),
        BlocProvider(create: (_) => ModelProductDropDownCubit())
      ],
      child: BlocBuilder<GetProductListCubit, List<DropdownMenuItem<int>>>(
        builder: (context, state) {
          return DropdownButtonFormField<int>(
            value: context.watch<ModelProductDropDownCubit>().state,
            onChanged: (value) {
              context
                  .read<ModelProductDropDownCubit>()
                  .getSelectedModelProduct(value!);
            },
            items: state,
            onSaved: (value) {
              BlocProvider.of<RegisterEntryOrderBloc>(context).add(StoreProduct(value!));
            },
          );
        },
      ),
    );
  }
}
