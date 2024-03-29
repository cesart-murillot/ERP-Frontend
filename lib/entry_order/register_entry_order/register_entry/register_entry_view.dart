import 'package:erp_fronted/entry_order/register_entry_order/get_product_list/get_product_list_view.dart';
import 'package:erp_fronted/entry_order/register_entry_order/register_entry_order_bloc.dart';
import 'package:erp_fronted/entry_order/register_entry_order/register_entry_order_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_entry_cubit.dart';
import 'register_entry_state.dart';

class RegisterEntryPage extends StatelessWidget {
  const RegisterEntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterEntryCubit, RegisterEntryState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                const Flexible(
                  flex: 3,
                  child: GetProductListPage(),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Flexible(
                  flex: 2,
                  child: TextFormField(
                    onSaved: (value) {
                      BlocProvider.of<RegisterEntryOrderBloc>(context)
                          .add(StoreQuantity(int.parse(value!)));
                    },
                    onChanged: (value) {
                      //context.read<RegisterEntryCubit>().printFromCubit(value);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Cantidad',
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
          ],
        );
      },
    );
  }
}
