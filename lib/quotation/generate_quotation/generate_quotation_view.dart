import 'package:erp_fronted/entry_order/register_entry_order/add_new_product/add_new_product_cubit.dart';
import 'package:erp_fronted/entry_order/register_entry_order/get_product_list/get_product_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:erp_fronted/entry_order/register_entry_order/add_new_product/add_new_product_view.dart';


import 'generate_quotation_bloc.dart';
import 'generate_quotation_event.dart';
import 'generate_quotation_state.dart';

class GenerateQuotationPage extends StatelessWidget {
  const GenerateQuotationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GenerateQuotationBloc()),
        BlocProvider(create: (_) => AddNewProductCubit()),
        BlocProvider(create: (_) => GetProductListCubit()),
      ],
      child: Builder(
        builder: (context) => Scaffold(
          body: const StateViews(),
          appBar: AppBar(),
        ),
      ),
    );
  }
}

class StateViews extends StatelessWidget {
  const StateViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateQuotationBloc, GenerateQuotationState>(
      builder: (context, state) {
        return const GenerateQuotation();
      },
    );
  }
}

class GenerateQuotation extends StatelessWidget {
  const GenerateQuotation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informacion del Cliente: ',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Apellido o Razon Social',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Detalle de Productos: ',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Flexible(
                  flex: 2,
                  child: SizedBox(),
                ),
                Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      context.read<GetProductListCubit>().getProduct();
                      context.read<AddNewProductCubit>().addInputField();
                    },
                    child: const Text('Añadir Producto'),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      context.read<AddNewProductCubit>().removeInputField();
                    },
                    child: const Text('Remover Producto'),
                  ),
                )
              ],
            ),
            const ProductList(),
          ],
        ),
      ),
    );
  }
}
