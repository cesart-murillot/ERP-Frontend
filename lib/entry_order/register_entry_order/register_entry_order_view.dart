import 'package:erp_fronted/drop_down/product_drop_down/product_drop_down_view.dart';
import 'package:erp_fronted/entry_order/register_entry_order/add_new_product/add_new_product_cubit.dart';
import 'package:erp_fronted/entry_order/register_entry_order/get_product_list/get_product_list_cubit.dart';
import 'package:erp_fronted/entry_order/register_entry_order/register_entry/register_entry_cubit.dart';
import 'package:erp_fronted/entry_order/register_entry_order/register_entry_order_event.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_entry_order_bloc.dart';
import 'register_entry_order_state.dart';

class RegisterEntryOrderPage extends StatelessWidget {
  RegisterEntryOrderPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegisterEntryOrderBloc()),
        BlocProvider(
          create: (_) => RegisterEntryCubit(),
        ),
        BlocProvider(create: (_) => AddNewProductCubit()),
        BlocProvider(create: (_) => GetProductListCubit()),
      ],
      child: Builder(
        builder: (context) => Form(
          key: _formKey,
          child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      _formKey.currentState?.save();

                      showDialog(
                        context: context,
                        builder: (_) =>
                            BlocProvider<RegisterEntryOrderBloc>.value(
                          value:
                              BlocProvider.of<RegisterEntryOrderBloc>(context),
                          child: const VerificationDialog(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.save))
              ],
            ),
            body: const EntryOrderForm(),
          ),
        ),
      ),
    );
  }
}

class EntryOrderForm extends StatelessWidget {
  const EntryOrderForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterEntryOrderBloc, RegisterEntryOrderState>(
      builder: (context, state) {
        return const EntryOrderInformation();
      },
    );
  }
}

class EntryOrderInformation extends StatefulWidget {
  const EntryOrderInformation({Key? key}) : super(key: key);

  @override
  State<EntryOrderInformation> createState() => _EntryOrderInformationState();
}

class _EntryOrderInformationState extends State<EntryOrderInformation> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 16.0,
              bottom: 8.0,
            ),
            child: TextFormField(
              onSaved: (value) {
                if (value != null) {
                  BlocProvider.of<RegisterEntryOrderBloc>(context)
                      .add(StoreCodeEvent(value));
                }
              },
              initialValue: DateTime.now().toString(),
              readOnly: true,
              decoration: const InputDecoration(
                label: Text(
                  'Código - Orden de Ingreso',
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          //const ProductList(),
          const ProductEntryOrder(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      showDialog(
                        context: context,
                        builder: (_) => BlocProvider.value(
                          value:
                              BlocProvider.of<RegisterEntryOrderBloc>(context),
                          child: const VerificationDialog(),
                        ),
                      ).then(
                        (value) {
                          context
                              .read<RegisterEntryOrderBloc>()
                              .add(const ClearMapList());
                        },
                      );
                    }
                  }
                },
                child: const Text('Registar orden de ingreso'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductEntryOrder extends StatefulWidget {
  const ProductEntryOrder({Key? key}) : super(key: key);

  @override
  State<ProductEntryOrder> createState() => _ProductEntryOrderState();
}

class _ProductEntryOrderState extends State<ProductEntryOrder> {
  List<TextEditingController> productController = [TextEditingController()];
  List<TextEditingController> quantityController = [TextEditingController()];
  List<TextEditingController> productIdController = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ActionChip(
                  onPressed: () {
                    setState(() {
                      productController.add(TextEditingController());
                      quantityController.add(TextEditingController());
                      productIdController.add(TextEditingController());
                    });
                  },
                  label: const Text('Añadir productos'),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          height: 76.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: TextFormField(
                              readOnly: true,
                              controller: productController[index],
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => const ProductDropDownPage(),
                                ).then(
                                  (product) {
                                    if (product != null && product is Product) {
                                      productController[index].text =
                                          product.modelProduct;
                                      if (product.id != null) {
                                        productIdController[index].text =
                                            product.id.toString();
                                      }
                                    }
                                  },
                                );
                              },
                              decoration: const InputDecoration(
                                label: Text('Producto'),
                                border: OutlineInputBorder(),
                              ),
                              validator: (product) {
                                if (product == null || product.isEmpty) {
                                  return 'Ingrese un producto';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          height: 76.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: quantityController[index],
                              decoration: const InputDecoration(
                                label: Text('Cantidad'),
                                border: OutlineInputBorder(),
                              ),
                              validator: (quantity) {
                                if (quantity == null || quantity.isEmpty) {
                                  return 'Ingrese la cantidad';
                                }
                                if (int.parse(quantity) < 1) {
                                  return 'Ingrese una cantidad mayor a cero';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                if (value != null) {
                                  final int productId = int.parse(
                                      productIdController[index].value.text);
                                  final int quantity = int.parse(value);
                                  final Map<String, int> productQuantity = {
                                    'productId': productId,
                                    'quantity': quantity
                                  };
                                  context.read<RegisterEntryOrderBloc>().add(
                                      StoreProductQuantityEvent(
                                          productQuantity));
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: SizedBox(
                          height: 76.0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                productController.removeAt(index);
                                quantityController.removeAt(index);
                                productIdController.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.remove),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: productController.length,
            ),
          ),
        ],
      ),
    );
  }
}

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<RegisterEntryOrderBloc, RegisterEntryOrderState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Registar Orden de Ingreso'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancelar');
                context
                    .read<RegisterEntryOrderBloc>()
                    .add(const ClearMapList());
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context.read<RegisterEntryOrderBloc>().add(const SaveData());
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
              child: const Text('Registrar'),
            ),
          ],
        );
      },
    );
  }
}
