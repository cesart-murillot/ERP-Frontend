import 'package:erp_fronted/branch/models/branch_model.dart';
import 'package:erp_fronted/employee/models/user_model.dart';
import 'package:erp_fronted/product/models/product_model.dart';
import 'package:erp_fronted/product_request/request_product/product_dropdown/product_dropdown_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'request_product_bloc.dart';
import 'request_product_event.dart';
import 'request_product_state.dart';

class RequestProductPage extends StatelessWidget {
  RequestProductPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RequestProductBloc()..add(InitEvent()),
      child: Builder(
          builder: (context) => Form(
                key: _form,
                child: Scaffold(
                  body: const RequestProduct(),
                  appBar: AppBar(
                    actions: [
                      IconButton(
                        onPressed: () {
                          _form.currentState?.save();
                          showDialog(
                            context: context,
                            builder: (_) => BlocProvider.value(
                              value:
                                  BlocProvider.of<RequestProductBloc>(context),
                              child: const VerificationDialog(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}

class RequestProduct extends StatelessWidget {
  const RequestProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestProductBloc, RequestProductState>(
      builder: (context, state) {
        switch (state.state) {
          case RequestProductViewState.initial:
            return const Center(
              child: Text('Cargando...'),
            );
            break;
          case RequestProductViewState.loaded:
            if (state.user != null && state.branch != null) {
              return RequestForm(
                user: state.user,
                branch: state.branch,
              );
            }
            return const Center(
              child: Text('No hay informacion del usuario'),
            );
          case RequestProductViewState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            return const Center(
              child: Text('Error'),
            );
        }
      },
    );
  }
}

class RequestForm extends StatelessWidget {
  const RequestForm({Key? key, required this.user, this.branch})
      : super(key: key);
  final User? user;
  final Branch? branch;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestProductBloc, RequestProductState>(
      builder: (context, state) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Se realizara la solicitud como:\n${user?.employee?.namesEmployee} ${user?.employee?.lastNameEmployee}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Cargo: ${user?.role?.nameRole}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Contacto: ${user?.email}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Para: ${branch?.nameBranch}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Dirección: ${branch!.addressBranch}',
                  style: const TextStyle(fontSize: 18.0),
                ),
/*                const FormGeneratorPage(
                  element: ProductQuantity(),
                ),*/
                const RequestProductForm(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestProductBloc, RequestProductState>(
      builder: (context, state) {
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Flexible(
                flex: 3,
                child: ProductDropdownPage(),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Flexible(
                flex: 1,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                    LimitRangeTextInputFormatter(1, 100)
                  ],
                  onSaved: (value) {
                    context
                        .read<RequestProductBloc>()
                        .add(AddQuantityEvent(int.parse(value!)));
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cantidad',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class RequestProductForm extends StatefulWidget {
  const RequestProductForm({Key? key}) : super(key: key);

  @override
  State<RequestProductForm> createState() => _RequestProductFormState();
}

class _RequestProductFormState extends State<RequestProductForm> {
  final _formKey = GlobalKey<FormState>();
  List<int> elements = [];
  List<TextEditingController> products = [];
  List<TextEditingController> units = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Flexible(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        elements.add(1);
                        products.add(TextEditingController());
                        units.add(TextEditingController());
                      });
                    },
                    child: const Text('Añadir'),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Row(
                    children: [
                      Flexible(
                        child: ProductQuantityField(
                          modelController: products[index],
                          numberController: units[index],
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          onPressed: () {
                            print(index);
                            setState(() {
                              elements.removeAt(index);
                              products.removeAt(index);
                              units.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.remove,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                childCount: elements.length,
              ),
            ),
            SliverToBoxAdapter(
              child: FloatingActionButton(
                onPressed: () {
                  _formKey.currentState?.save();
                },
                child: Text('Registrar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductQuantityField extends StatefulWidget {
  const ProductQuantityField({Key? key, required this.modelController, required this.numberController}) : super(key: key);

  final TextEditingController modelController;
  final TextEditingController numberController;
  @override
  State<ProductQuantityField> createState() => _ProductQuantityFieldState();
}

class _ProductQuantityFieldState extends State<ProductQuantityField> {

  int maxNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            controller: widget.modelController,
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<RequestProductBloc>(context),
                  child: const ProductDialog(),
                ),
              ).then((product) {
                if (product is Product) {
                  setState(() {
                    maxNumber = product.remainUnits ?? 1;
                  });
                }
              });
            },
            onSaved: (value) {
              print(value);
            },
          ),
        ),
        Flexible(
          child: TextFormField(
            controller: widget.numberController,
            decoration: InputDecoration(
              counterText: '$maxNumber unidades disponibles',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LimitRangeTextInputFormatter(1, maxNumber),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductDialog extends StatelessWidget {
  const ProductDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestProductBloc, RequestProductState>(
      builder: (context, state) {
        final elements = context.read<RequestProductBloc>().state.products;
        if (elements != null) {
          return AlertDialog(
            content: SizedBox(
              height: 512.0,
              width: 256.0,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final Product product = elements[index]['product'];
                        return ListTile(
                          title: Text(product.modelProduct),
                          onTap: () {
                            Navigator.pop(context, product);
                          },
                        );
                      },
                      childCount: elements.length,
                    ),
                  ),
                ],
              ),
            ),
            scrollable: true,
          );
        }
        return const SizedBox(
          height: 8.0,
          width: 8.0,
        );
      },
    );
  }
}

class VerificationDialog extends StatelessWidget {
  const VerificationDialog({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return BlocBuilder<RequestProductBloc, RequestProductState>(
      builder: (context, state) {
        return AlertDialog(
          title: const Text('Generar Solicitud'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancelar');
                context.read<RequestProductBloc>().add(const ClearDataEvent());
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context.read<RequestProductBloc>().add(const SaveDataEvent());
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}

class LimitRangeTextInputFormatter extends TextInputFormatter {
  LimitRangeTextInputFormatter(this.min, this.max) : assert(min <= max);

  final int min;
  final int max;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var value = int.parse(newValue.text);
    if (value < min) {
      return TextEditingValue(text: min.toString());
    } else if (value > max) {
      return TextEditingValue(text: max.toString());
    }
    return newValue;
  }
}
