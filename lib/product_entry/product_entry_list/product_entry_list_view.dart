import 'package:erp_fronted/product_entry/verify_product_entry/verify_product_entry_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_entry_list_bloc.dart';
import 'product_entry_list_event.dart';
import 'product_entry_list_state.dart';

class ProductEntryListPage extends StatelessWidget {
  const ProductEntryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductEntryListBloc()..add(const GetProductEntryEvent()),
      child: const Scaffold(
        body: ProductEntryList(),
      ),
    );
  }
}

class ProductEntryList extends StatelessWidget {
  const ProductEntryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductEntryListBloc, ProductEntryListState>(
      builder: (context, state) {
        if (state is LoadingProductEntriesState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedProductEntriesState) {
          var productEntries = state.productEntries.productEntries;
          return ListView.builder(
            itemCount: productEntries.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  isThreeLine: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyProductEntryPage(productEntryId: productEntries[index].id!,),
                      ),
                    );
                  },
                  trailing: productEntries[index].verified == true
                      ? const Chip(
                          label: Text(
                            'Verificado',
                            style: TextStyle(fontSize: 10.0),
                          ),
                          backgroundColor: Colors.green,
                        )
                      : const Chip(
                          label: Text(
                            'Pendiente',
                            style: TextStyle(fontSize: 10.0),
                          ),
                          backgroundColor: Colors.amberAccent,
                        ),
                  title: Text('Producto: ' +
                      productEntries[index].product.modelProduct),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (productEntries[index]
                                  .entryOrder
                                  .verifiedEntryOrder !=
                              null)
                            productEntries[index]
                                        .entryOrder
                                        .verifiedEntryOrder ==
                                    true
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.hourglass_bottom,
                                    color: Colors.blueGrey,
                                  ),
                          Text(
                            'Orden de Ingreso: ' +
                                state.productEntries.productEntries[index]
                                    .entryOrder.codeEntryOrder,
                          ),
                        ],
                      ),
                      Text(
                        'Cantidad: ' +
                            productEntries[index].quantity.toString(),
                      ),
                      Text(
                        'Fecha de Ingreso: ' + productEntries[index].createdAt,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const Text('error');
      },
    );
  }
}
